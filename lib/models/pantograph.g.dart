// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantograph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalStateImpl _$$GoalStateImplFromJson(Map<String, dynamic> json) =>
    _$GoalStateImpl(
      goals: (json['goals'] as List<dynamic>)
          .map((e) => Goal.fromJson(e as Map<String, dynamic>))
          .toList(),
      is_solved: json['is_solved'] as bool,
    );

Map<String, dynamic> _$$GoalStateImplToJson(_$GoalStateImpl instance) =>
    <String, dynamic>{
      'goals': instance.goals,
      'is_solved': instance.is_solved,
    };

_$GoalImpl _$$GoalImplFromJson(Map<String, dynamic> json) => _$GoalImpl(
      varibles: (json['varibles'] as List<dynamic>)
          .map((e) => Variable.fromJson(e as Map<String, dynamic>))
          .toList(),
      target: json['target'] as String,
      sibling_dep: (json['sibling_dep'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      name: json['name'] as String?,
      is_conversion: json['is_conversion'] as bool,
    );

Map<String, dynamic> _$$GoalImplToJson(_$GoalImpl instance) =>
    <String, dynamic>{
      'varibles': instance.varibles,
      'target': instance.target,
      'sibling_dep': instance.sibling_dep,
      'name': instance.name,
      'is_conversion': instance.is_conversion,
    };

_$VariableImpl _$$VariableImplFromJson(Map<String, dynamic> json) =>
    _$VariableImpl(
      t: json['t'] as String,
      v: json['v'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$VariableImplToJson(_$VariableImpl instance) =>
    <String, dynamic>{
      't': instance.t,
      'v': instance.v,
      'name': instance.name,
    };
