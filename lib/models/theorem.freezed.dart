// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theorem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Theorem _$TheoremFromJson(Map<String, dynamic> json) {
  return _Theorem.fromJson(json);
}

/// @nodoc
mixin _$Theorem {
  String? get goal => throw _privateConstructorUsedError;
  set goal(String? value) => throw _privateConstructorUsedError;
  String? get variables => throw _privateConstructorUsedError;
  set variables(String? value) => throw _privateConstructorUsedError;

  /// Serializes this Theorem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Theorem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TheoremCopyWith<Theorem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TheoremCopyWith<$Res> {
  factory $TheoremCopyWith(Theorem value, $Res Function(Theorem) then) =
      _$TheoremCopyWithImpl<$Res, Theorem>;
  @useResult
  $Res call({String? goal, String? variables});
}

/// @nodoc
class _$TheoremCopyWithImpl<$Res, $Val extends Theorem>
    implements $TheoremCopyWith<$Res> {
  _$TheoremCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Theorem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = freezed,
    Object? variables = freezed,
  }) {
    return _then(_value.copyWith(
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String?,
      variables: freezed == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TheoremImplCopyWith<$Res> implements $TheoremCopyWith<$Res> {
  factory _$$TheoremImplCopyWith(
          _$TheoremImpl value, $Res Function(_$TheoremImpl) then) =
      __$$TheoremImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? goal, String? variables});
}

/// @nodoc
class __$$TheoremImplCopyWithImpl<$Res>
    extends _$TheoremCopyWithImpl<$Res, _$TheoremImpl>
    implements _$$TheoremImplCopyWith<$Res> {
  __$$TheoremImplCopyWithImpl(
      _$TheoremImpl _value, $Res Function(_$TheoremImpl) _then)
      : super(_value, _then);

  /// Create a copy of Theorem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = freezed,
    Object? variables = freezed,
  }) {
    return _then(_$TheoremImpl(
      goal: freezed == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String?,
      variables: freezed == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TheoremImpl with DiagnosticableTreeMixin implements _Theorem {
  _$TheoremImpl({this.goal, this.variables});

  factory _$TheoremImpl.fromJson(Map<String, dynamic> json) =>
      _$$TheoremImplFromJson(json);

  @override
  String? goal;
  @override
  String? variables;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Theorem(goal: $goal, variables: $variables)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Theorem'))
      ..add(DiagnosticsProperty('goal', goal))
      ..add(DiagnosticsProperty('variables', variables));
  }

  /// Create a copy of Theorem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TheoremImplCopyWith<_$TheoremImpl> get copyWith =>
      __$$TheoremImplCopyWithImpl<_$TheoremImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TheoremImplToJson(
      this,
    );
  }
}

abstract class _Theorem implements Theorem {
  factory _Theorem({String? goal, String? variables}) = _$TheoremImpl;

  factory _Theorem.fromJson(Map<String, dynamic> json) = _$TheoremImpl.fromJson;

  @override
  String? get goal;
  set goal(String? value);
  @override
  String? get variables;
  set variables(String? value);

  /// Create a copy of Theorem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TheoremImplCopyWith<_$TheoremImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
