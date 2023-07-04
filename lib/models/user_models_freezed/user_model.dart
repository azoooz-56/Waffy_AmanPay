import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
 class UserModel with _$UserModel {
  const factory UserModel({
    required String? uid,
    required String? fname,
    required String? lname,
    required String? pid,
    required String? phone,
    required String? passcode,
    required double? rate,
    required String? status,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
