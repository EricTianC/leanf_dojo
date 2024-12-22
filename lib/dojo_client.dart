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

  final String remoteUri;
  String? get uuid => goalState?.uuid;

  Future<void> _testFunc() async {
    try {
      await goalStart(prop: "forall (p q: Prop), Or p q -> Or q p");
      await goalTactic(uuid: uuid!, goalId: 0, tactic: "aesop");
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
      {required String uuid,
      required int goalId,
      required String tactic}) async {
    try {
      var result = await dio.get("$remoteUri/goal_tactic", queryParameters: {
        "UUID": uuid,
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

  Future<void> closeUuid() async {
    try {
      await dio.get("$remoteUri/close_uuid", queryParameters: {
        "UUID": uuid,
      });
      logger.t("state: $uuid closed.");
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
    closeUuid();
    goalState = null;
    notifyListeners();
  }

  @override
  void dispose() {
    closeUuid();
    super.dispose();
  }
}
