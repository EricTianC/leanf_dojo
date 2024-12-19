/// PantoGraph 的对应模型类
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pantograph.freezed.dart';
part 'pantograph.g.dart';

@freezed
class GoalState with _$GoalState {
  factory GoalState({required List<Goal> goals, required bool is_solved}) =
      _GoalState;

  factory GoalState.fromJson(Map<String, Object?> json) =>
      _$GoalStateFromJson(json);
}

@freezed
class Goal with _$Goal {
  factory Goal(
      {required List<Variable> varibles,
      required String target,
      required List<int> sibling_dep,
      String? name,
      required bool is_conversion}) = _Goal;

  factory Goal.fromJson(Map<String, Object?> json) => _$GoalFromJson(json);
}

@freezed
class Variable with _$Variable {
  factory Variable({required String t, String? v, String? name}) = _Variable;

  factory Variable.fromJson(Map<String, Object?> json) =>
      _$VariableFromJson(json);
}