// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      topupLimit: (json['topupLimit'] as num?)?.toDouble(),
      isVerified: json['isverified'] as bool?,
      beneficiaries: (json['beneficiaries'] as List<dynamic>?)
          ?.map((e) => Beneficiary.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'balance': instance.balance,
      'topupLimit': instance.topupLimit,
      'isverified': instance.isVerified,
      'beneficiaries': instance.beneficiaries,
      'transactions': instance.transactions,
    };

Beneficiary _$BeneficiaryFromJson(Map<String, dynamic> json) => Beneficiary(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      nickname: json['nickname'] as String?,
      limit: (json['limit'] as num?)?.toDouble(),
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$BeneficiaryToJson(Beneficiary instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'limit': instance.limit,
      'phone': instance.phone,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      transactionId: json['_id'] as String?,
      userId: json['userId'] as String?,
      beneficiaryNickname: json['beneficiaryNickname'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      direction: json['direction'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      '_id': instance.transactionId,
      'userId': instance.userId,
      'beneficiaryNickname': instance.beneficiaryNickname,
      'amount': instance.amount,
      'timestamp': instance.timestamp?.toIso8601String(),
      'direction': instance.direction,
    };
