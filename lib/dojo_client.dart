/// 用于连接 leanf_backend
///  https://github.com/EricTianC/leanf_backend
library;

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:leanf_dojo/models/pantograph.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Dio dio = Dio();

Logger logger = Logger();

class DojoClient extends ChangeNotifier {
  GoalState? goalState;

  int? _selectedGoalId;
  int? get selectedGoalId {
    if (goalState == null) {
      _selectedGoalId = null;
      return null;
    }
    if (_selectedGoalId == null) {
      _selectedGoalId == 0;
    }
    if (_selectedGoalId! >= goalState!.goals.length) {
      _selectedGoalId = goalState!.goals.length - 1;
    }
    return _selectedGoalId;
  }

  final String remoteUri;
  String? get session => goalState?.session;

  Future<void> _testFunc() async {
    try {
      await goalStart(prop: "forall (p q: Prop), Or p q -> Or q p");
      await goalTactic(session: session!, goalId: 0, tactic: "aesop");
      logger.t(goalState);
    } catch (e) {
      // Fluttertoast.showToast(msg: "请检查输入 qwq");
      logger.e(e.toString());
    }
  }

  Future<void> goalStart({required String prop}) async {
    try {
      var result = await dio
          .get("$remoteUri/goal_start", queryParameters: {"prop": prop});
      goalState = GoalState.fromJson(result.data);
      notifyListeners();
      logger.t(goalState);
    } catch (e) {
      // Fluttertoast.showToast(msg: "请检查输入 qwq");
      logger.e(e.toString());
    }
  }

  Future<void> goalTactic(
      {required String session,
      required int goalId,
      required String tactic}) async {
    try {
      var result = await dio.get("$remoteUri/goal_tactic", queryParameters: {
        "session": session,
        "goal_id": goalId,
        "tactic": tactic,
      });
      goalState = GoalState.fromJson(result.data);
      notifyListeners();
      logger.t(goalState);
    } catch (e) {
      // Fluttertoast.showToast(msg: "请检查输入 qwq");
      logger.e(e.toString());
    }
  }

  Future<void> closeSession() async {
    try {
      await dio.get("$remoteUri/close_session", queryParameters: {
        "session": session,
      });
      logger.t("session: $session closed.");
    } catch (e) {
      logger.e(e.toString());
    }
  }

  DojoClient({this.remoteUri = "http://127.0.0.1:9090"}) {
    try {
      _testFunc();
    } catch (e) {
      logger.e(e.toString());
    }
  }

  void resetGoal() {
    closeSession();
    goalState = null;
    notifyListeners();
  }

  @override
  void dispose() {
    closeSession();
    super.dispose();
  }
}
