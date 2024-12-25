/// 用于连接 leanf_backend
///  https://github.com/EricTianC/leanf_backend
library;

import 'dart:async';
// import 'package:flutter/foundation.dart';
import 'package:leanf_dojo/models/pantograph.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
// import 'package:fluttertoast/fluttertoast.dart';

Dio dio = Dio();

Logger logger = Logger();

class DojoClient {
  // GoalState? goalState;

  final String remoteUri;
  // String? get uuid => goalState?.uuid;

  Future<void> _testFunc() async {
    try {
      var state0 =
          await goalStart(prop: "forall (p q: Prop), Or p q -> Or q p");
      var state1 = await goalTactic(state: state0!, goalId: 0, tactic: "aesop");
      // logger.t(state1);
      assert(state1?.is_solved == true);
    } catch (e) {
      // Fluttertoast.showToast(msg: "请检查输入 qwq");
      logger.e(e.toString());
    }
  }

  Future<GoalState?> goalStart({required String prop}) async {
    try {
      var result = await dio
          .get("$remoteUri/goal_start", queryParameters: {"prop": prop});
      GoalState goalState = GoalState.fromJson(result.data);
      logger.t(goalState);
      return goalState;
    } catch (e) {
      // Fluttertoast.showToast(msg: "请检查输入 qwq");
      logger.e(e.toString());
      return null;
    }
  }

  Future<GoalState?> goalTactic(
      {required GoalState state,
      required int goalId,
      required String tactic}) async {
    try {
      var result = await dio.get("$remoteUri/goal_tactic", queryParameters: {
        "UUID": state.uuid,
        "goal_id": goalId,
        "tactic": tactic,
      });
      GoalState goalState = GoalState.fromJson(result.data);
      logger.t(goalState);
      return goalState;
    } catch (e) {
      // Fluttertoast.showToast(msg: "请检查输入 qwq");
      logger.e(e.toString());
      return null;
    }
  }

  Future<void> closeState(GoalState state) async {
    try {
      await dio.get("$remoteUri/close_uuid", queryParameters: {
        "UUID": state.uuid,
      });
      logger.t("state: ${state.uuid} closed.");
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

  // void resetGoal() {
  //   closeState();
  //   goalState = null;
  //   notifyListeners();
  // }

  // @override
  // void dispose() {
  //   closeState();
  //   super.dispose();
  // }
}
