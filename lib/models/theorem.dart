/// dojo 的 models 模型类
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'theorem.freezed.dart';
part 'theorem.g.dart';

@unfreezed
class Theorem with _$Theorem {
  factory Theorem({String? goal, String? variables}) = _Theorem;

  factory Theorem.fromJson(Map<String, dynamic> json) =>
      _$TheoremFromJson(json);
}
