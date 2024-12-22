import 'package:flutter/foundation.dart';
import 'package:leanf_dojo/dojo_client.dart';
import 'package:leanf_dojo/models/pantograph.dart';

class Workplace extends ChangeNotifier {
  DojoClient dojoClient;

  String get remoteUri => dojoClient.remoteUri;
  GoalState? get goalState => dojoClient.goalState;

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

  set selectedGoalId(int? value) {
    _selectedGoalId = value;
    notifyListeners();
  }

  Workplace({String? remoteUri})
      : dojoClient =
            remoteUri == null ? DojoClient() : DojoClient(remoteUri: remoteUri);
}
