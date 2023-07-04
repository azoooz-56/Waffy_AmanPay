// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get uid => throw _privateConstructorUsedError;
  String? get fname => throw _privateConstructorUsedError;
  String? get lname => throw _privateConstructorUsedError;
  String? get pid => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get passcode => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? uid,
      String? fname,
      String? lname,
      String? pid,
      String? phone,
      String? passcode,
      double? rate,
      String? status});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? fname = freezed,
    Object? lname = freezed,
    Object? pid = freezed,
    Object? phone = freezed,
    Object? passcode = freezed,
    Object? rate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      fname: freezed == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
      pid: freezed == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      passcode: freezed == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? fname,
      String? lname,
      String? pid,
      String? phone,
      String? passcode,
      double? rate,
      String? status});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? fname = freezed,
    Object? lname = freezed,
    Object? pid = freezed,
    Object? phone = freezed,
    Object? passcode = freezed,
    Object? rate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_UserModel(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      fname: freezed == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
      pid: freezed == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      passcode: freezed == passcode
          ? _value.passcode
          : passcode // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.uid,
      required this.fname,
      required this.lname,
      required this.pid,
      required this.phone,
      required this.passcode,
      required this.rate,
      required this.status});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String? uid;
  @override
  final String? fname;
  @override
  final String? lname;
  @override
  final String? pid;
  @override
  final String? phone;
  @override
  final String? passcode;
  @override
  final double? rate;
  @override
  final String? status;

  @override
  String toString() {
    return 'UserModel(uid: $uid, fname: $fname, lname: $lname, pid: $pid, phone: $phone, passcode: $passcode, rate: $rate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.fname, fname) || other.fname == fname) &&
            (identical(other.lname, lname) || other.lname == lname) &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.passcode, passcode) ||
                other.passcode == passcode) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, fname, lname, pid, phone, passcode, rate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String? uid,
      required final String? fname,
      required final String? lname,
      required final String? pid,
      required final String? phone,
      required final String? passcode,
      required final double? rate,
      required final String? status}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get uid;
  @override
  String? get fname;
  @override
  String? get lname;
  @override
  String? get pid;
  @override
  String? get phone;
  @override
  String? get passcode;
  @override
  double? get rate;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
