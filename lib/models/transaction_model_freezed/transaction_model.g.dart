// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionModel _$$_TransactionModelFromJson(Map<String, dynamic> json) =>
    _$_TransactionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      benefits_price: (json['benefits_price'] as num).toDouble(),
      image: json['image'] as String,
      receiver_email: json['receiver_email'] as String,
      uuid: json['uuid'] as String,
      transaction_status: json['transaction_status'] as String,
      status: json['status'] as String,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$_TransactionModelToJson(_$_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'benefits_price': instance.benefits_price,
      'image': instance.image,
      'receiver_email': instance.receiver_email,
      'uuid': instance.uuid,
      'transaction_status': instance.transaction_status,
      'status': instance.status,
      'created_at': instance.created_at,
    };
