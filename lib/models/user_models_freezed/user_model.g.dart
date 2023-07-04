// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      pid: json['pid'] as String?,
      phone: json['phone'] as String?,
      passcode: json['passcode'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fname': instance.fname,
      'lname': instance.lname,
      'pid': instance.pid,
      'phone': instance.phone,
      'passcode': instance.passcode,
      'rate': instance.rate,
      'status': instance.status,
    };
