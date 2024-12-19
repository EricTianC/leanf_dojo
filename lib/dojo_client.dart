/// 用于连接 leanf_backend
///  https://github.com/EricTianC/leanf_backend
library;

import 'dart:async';
import 'dart:convert';
import 'package:leanf_dojo/models/pantograph.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

Dio dio = Dio();

Logger logger = Logger();

class DojoClient {
  GoalState? goalState;

  final String remoteUri;

  Future<void> testFunc() async {
    try {
      var result = await dio.get("$remoteUri/goal_start",
          queryParameters: {"prop": "forall (p q: Prop), Or p q -> Or q p"});
      logger.t(result.data);

      GoalState testState = GoalState(goals: [
        Goal(
            varibles: [],
            target: "forall (p q: Prop), Or p q -> Or q p",
            sibling_dep: [],
            is_conversion: false)
      ], is_solved: false);
      logger.t(testState.toJson());
    } catch (e) {
      logger.e(e.toString());
    }
  }

  DojoClient({this.remoteUri = "http://127.0.0.1:9090"}) {
    try {
      testFunc();
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
