/// 用于连接 leanf_backend
///  https://github.com/EricTianC/leanf_backend
library;

import 'dart:async';
import 'package:leanf_dojo/models/pantograph.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Dio dio = Dio();

Logger logger = Logger();

class DojoClient {
  GoalState? goalState;

  final String remoteUri;
  String? get session => goalState?.session;

  Future<void> _testFunc() async {
    try {
      var result = await dio.get("$remoteUri/goal_start",
          queryParameters: {"prop": "forall (p q: Prop), Or p q -> Or q p"});
      logger.t(GoalState.fromJson(result.data));
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> goalStart({required String prop}) async {
    try {
      var result = await dio
          .get("$remoteUri/goal_start", queryParameters: {"prop": prop});
      goalState = GoalState.fromJson(result.data);
      logger.t(goalState);
    } catch (e) {
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
      logger.t(goalState);
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
}
