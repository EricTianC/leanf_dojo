// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantograph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoalState _$GoalStateFromJson(Map<String, dynamic> json) {
  return _GoalState.fromJson(json);
}

/// @nodoc
mixin _$GoalState {
  List<Goal> get goals => throw _privateConstructorUsedError;
  bool get is_solved => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;

  /// Serializes this GoalState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalStateCopyWith<GoalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalStateCopyWith<$Res> {
  factory $GoalStateCopyWith(GoalState value, $Res Function(GoalState) then) =
      _$GoalStateCopyWithImpl<$Res, GoalState>;
  @useResult
  $Res call({List<Goal> goals, bool is_solved, String uuid});
}

/// @nodoc
class _$GoalStateCopyWithImpl<$Res, $Val extends GoalState>
    implements $GoalStateCopyWith<$Res> {
  _$GoalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
    Object? is_solved = null,
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>,
      is_solved: null == is_solved
          ? _value.is_solved
          : is_solved // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalStateImplCopyWith<$Res>
    implements $GoalStateCopyWith<$Res> {
  factory _$$GoalStateImplCopyWith(
          _$GoalStateImpl value, $Res Function(_$GoalStateImpl) then) =
      __$$GoalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Goal> goals, bool is_solved, String uuid});
}

/// @nodoc
class __$$GoalStateImplCopyWithImpl<$Res>
    extends _$GoalStateCopyWithImpl<$Res, _$GoalStateImpl>
    implements _$$GoalStateImplCopyWith<$Res> {
  __$$GoalStateImplCopyWithImpl(
      _$GoalStateImpl _value, $Res Function(_$GoalStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
    Object? is_solved = null,
    Object? uuid = null,
  }) {
    return _then(_$GoalStateImpl(
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>,
      is_solved: null == is_solved
          ? _value.is_solved
          : is_solved // ignore: cast_nullable_to_non_nullable
              as bool,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalStateImpl with DiagnosticableTreeMixin implements _GoalState {
  _$GoalStateImpl(
      {required final List<Goal> goals,
      required this.is_solved,
      required this.uuid})
      : _goals = goals;

  factory _$GoalStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalStateImplFromJson(json);

  final List<Goal> _goals;
  @override
  List<Goal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final bool is_solved;
  @override
  final String uuid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoalState(goals: $goals, is_solved: $is_solved, uuid: $uuid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoalState'))
      ..add(DiagnosticsProperty('goals', goals))
      ..add(DiagnosticsProperty('is_solved', is_solved))
      ..add(DiagnosticsProperty('uuid', uuid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalStateImpl &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.is_solved, is_solved) ||
                other.is_solved == is_solved) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_goals), is_solved, uuid);

  /// Create a copy of GoalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalStateImplCopyWith<_$GoalStateImpl> get copyWith =>
      __$$GoalStateImplCopyWithImpl<_$GoalStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalStateImplToJson(
      this,
    );
  }
}

abstract class _GoalState implements GoalState {
  factory _GoalState(
      {required final List<Goal> goals,
      required final bool is_solved,
      required final String uuid}) = _$GoalStateImpl;

  factory _GoalState.fromJson(Map<String, dynamic> json) =
      _$GoalStateImpl.fromJson;

  @override
  List<Goal> get goals;
  @override
  bool get is_solved;
  @override
  String get uuid;

  /// Create a copy of GoalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalStateImplCopyWith<_$GoalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return _Goal.fromJson(json);
}

/// @nodoc
mixin _$Goal {
  List<Variable> get variables =>
      throw _privateConstructorUsedError; // corrected spelling
  String get target => throw _privateConstructorUsedError;
  List<int> get sibling_dep => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get is_conversion => throw _privateConstructorUsedError;

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res, Goal>;
  @useResult
  $Res call(
      {List<Variable> variables,
      String target,
      List<int> sibling_dep,
      String? name,
      bool is_conversion});
}

/// @nodoc
class _$GoalCopyWithImpl<$Res, $Val extends Goal>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variables = null,
    Object? target = null,
    Object? sibling_dep = null,
    Object? name = freezed,
    Object? is_conversion = null,
  }) {
    return _then(_value.copyWith(
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<Variable>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      sibling_dep: null == sibling_dep
          ? _value.sibling_dep
          : sibling_dep // ignore: cast_nullable_to_non_nullable
              as List<int>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      is_conversion: null == is_conversion
          ? _value.is_conversion
          : is_conversion // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoalImplCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$$GoalImplCopyWith(
          _$GoalImpl value, $Res Function(_$GoalImpl) then) =
      __$$GoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Variable> variables,
      String target,
      List<int> sibling_dep,
      String? name,
      bool is_conversion});
}

/// @nodoc
class __$$GoalImplCopyWithImpl<$Res>
    extends _$GoalCopyWithImpl<$Res, _$GoalImpl>
    implements _$$GoalImplCopyWith<$Res> {
  __$$GoalImplCopyWithImpl(_$GoalImpl _value, $Res Function(_$GoalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variables = null,
    Object? target = null,
    Object? sibling_dep = null,
    Object? name = freezed,
    Object? is_conversion = null,
  }) {
    return _then(_$GoalImpl(
      variables: null == variables
          ? _value._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<Variable>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      sibling_dep: null == sibling_dep
          ? _value._sibling_dep
          : sibling_dep // ignore: cast_nullable_to_non_nullable
              as List<int>,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      is_conversion: null == is_conversion
          ? _value.is_conversion
          : is_conversion // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalImpl with DiagnosticableTreeMixin implements _Goal {
  _$GoalImpl(
      {required final List<Variable> variables,
      required this.target,
      required final List<int> sibling_dep,
      this.name,
      required this.is_conversion})
      : _variables = variables,
        _sibling_dep = sibling_dep;

  factory _$GoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalImplFromJson(json);

  final List<Variable> _variables;
  @override
  List<Variable> get variables {
    if (_variables is EqualUnmodifiableListView) return _variables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variables);
  }

// corrected spelling
  @override
  final String target;
  final List<int> _sibling_dep;
  @override
  List<int> get sibling_dep {
    if (_sibling_dep is EqualUnmodifiableListView) return _sibling_dep;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sibling_dep);
  }

  @override
  final String? name;
  @override
  final bool is_conversion;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Goal(variables: $variables, target: $target, sibling_dep: $sibling_dep, name: $name, is_conversion: $is_conversion)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Goal'))
      ..add(DiagnosticsProperty('variables', variables))
      ..add(DiagnosticsProperty('target', target))
      ..add(DiagnosticsProperty('sibling_dep', sibling_dep))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('is_conversion', is_conversion));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalImpl &&
            const DeepCollectionEquality()
                .equals(other._variables, _variables) &&
            (identical(other.target, target) || other.target == target) &&
            const DeepCollectionEquality()
                .equals(other._sibling_dep, _sibling_dep) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.is_conversion, is_conversion) ||
                other.is_conversion == is_conversion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_variables),
      target,
      const DeepCollectionEquality().hash(_sibling_dep),
      name,
      is_conversion);

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      __$$GoalImplCopyWithImpl<_$GoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalImplToJson(
      this,
    );
  }
}

abstract class _Goal implements Goal {
  factory _Goal(
      {required final List<Variable> variables,
      required final String target,
      required final List<int> sibling_dep,
      final String? name,
      required final bool is_conversion}) = _$GoalImpl;

  factory _Goal.fromJson(Map<String, dynamic> json) = _$GoalImpl.fromJson;

  @override
  List<Variable> get variables; // corrected spelling
  @override
  String get target;
  @override
  List<int> get sibling_dep;
  @override
  String? get name;
  @override
  bool get is_conversion;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Variable _$VariableFromJson(Map<String, dynamic> json) {
  return _Variable.fromJson(json);
}

/// @nodoc
mixin _$Variable {
  String get t => throw _privateConstructorUsedError;
  String? get v => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this Variable to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Variable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VariableCopyWith<Variable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariableCopyWith<$Res> {
  factory $VariableCopyWith(Variable value, $Res Function(Variable) then) =
      _$VariableCopyWithImpl<$Res, Variable>;
  @useResult
  $Res call({String t, String? v, String? name});
}

/// @nodoc
class _$VariableCopyWithImpl<$Res, $Val extends Variable>
    implements $VariableCopyWith<$Res> {
  _$VariableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Variable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t = null,
    Object? v = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      t: null == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as String,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariableImplCopyWith<$Res>
    implements $VariableCopyWith<$Res> {
  factory _$$VariableImplCopyWith(
          _$VariableImpl value, $Res Function(_$VariableImpl) then) =
      __$$VariableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String t, String? v, String? name});
}

/// @nodoc
class __$$VariableImplCopyWithImpl<$Res>
    extends _$VariableCopyWithImpl<$Res, _$VariableImpl>
    implements _$$VariableImplCopyWith<$Res> {
  __$$VariableImplCopyWithImpl(
      _$VariableImpl _value, $Res Function(_$VariableImpl) _then)
      : super(_value, _then);

  /// Create a copy of Variable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? t = null,
    Object? v = freezed,
    Object? name = freezed,
  }) {
    return _then(_$VariableImpl(
      t: null == t
          ? _value.t
          : t // ignore: cast_nullable_to_non_nullable
              as String,
      v: freezed == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariableImpl with DiagnosticableTreeMixin implements _Variable {
  _$VariableImpl({required this.t, this.v, this.name});

  factory _$VariableImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariableImplFromJson(json);

  @override
  final String t;
  @override
  final String? v;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Variable(t: $t, v: $v, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Variable'))
      ..add(DiagnosticsProperty('t', t))
      ..add(DiagnosticsProperty('v', v))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariableImpl &&
            (identical(other.t, t) || other.t == t) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, t, v, name);

  /// Create a copy of Variable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VariableImplCopyWith<_$VariableImpl> get copyWith =>
      __$$VariableImplCopyWithImpl<_$VariableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariableImplToJson(
      this,
    );
  }
}

abstract class _Variable implements Variable {
  factory _Variable(
      {required final String t,
      final String? v,
      final String? name}) = _$VariableImpl;

  factory _Variable.fromJson(Map<String, dynamic> json) =
      _$VariableImpl.fromJson;

  @override
  String get t;
  @override
  String? get v;
  @override
  String? get name;

  /// Create a copy of Variable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VariableImplCopyWith<_$VariableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
