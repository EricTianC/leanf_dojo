import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leanf_dojo/dojo_client.dart';
import 'package:leanf_dojo/models/pantograph.dart';

class Workspace extends ChangeNotifier {
  DojoClient dojoClient;

  List<GoalState> goalStates = [];

  String get remoteUri => dojoClient.remoteUri;

  /// currentGoalState
  GoalState? _currentGoalState;

  GoalState? get currentGoalState {
    return _currentGoalState;
  }

  Goal? get selectedGoal => (selectedGoalId != null &&
          ((currentGoalState?.goals.length ?? 0) > (selectedGoalId ?? 0)))
      ? currentGoalState?.goals[selectedGoalId!]
      : null;

  set currentGoalState(GoalState? value) {
    _currentGoalState = value;
    notifyListeners();
  }

  /// selectedGoalId
  int? _selectedGoalId;
  int? get selectedGoalId {
    if (currentGoalState == null) {
      _selectedGoalId = null;
      return null;
    }

    return _selectedGoalId;
  }

  set selectedGoalId(int? value) {
    _selectedGoalId = value;
    notifyListeners();
  }

  /// 基于 currentGoalState 命令行模式的 goal_start 命令
  Future<void> runGoalStart({required String prop}) async {
    GoalState? goalState = await dojoClient.goalStart(prop: prop);
    if (goalState != null) {
      goalStates.add(goalState);
      currentGoalState = goalState;
    }
  }

  /// 基于 currentGoalState 命令行模式的 goal_tactic 命令
  Future<void> runGoalTactic(
      {required GoalState state,
      required int goalId,
      required String tactic}) async {
    GoalState? newState = await dojoClient.goalTactic(
        state: state, goalId: selectedGoalId ?? 0, tactic: tactic);
    if (newState != null) {
      goalStates.add(newState);
      currentGoalState = newState;
    }
  }

  Workspace({String? remoteUri})
      : dojoClient =
            remoteUri == null ? DojoClient() : DojoClient(remoteUri: remoteUri);
}
