import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
 class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String name,
    required String description,
    required double price,
    required double benefits_price,
    required String image,
    required String receiver_email,
    required String uuid,
    required String transaction_status,
    required String status,
    required String created_at
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
