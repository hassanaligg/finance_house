import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? phone;
  final double? balance;
  final double? topupLimit;
  @JsonKey(name: 'isverified')
  final bool? isVerified;
  final List<Beneficiary>? beneficiaries;
  final List<Transaction>? transactions;

  User({
    this.id,
    this.name,
    this.phone,
    this.balance,
    this.topupLimit,
    this.isVerified,
    this.beneficiaries,
    this.transactions,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Beneficiary {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? nickname;
  final double? limit;
  final String? phone;

  Beneficiary({
    this.id,
    this.name,
    this.nickname,
    this.limit,
    this.phone,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: '_id')
  final String? transactionId;

  final String? userId;
  final String? beneficiaryNickname;
  final double? amount;

  final DateTime? timestamp;

  // "incoming" or "outgoing" db values
  final String? direction;

  Transaction({
    this.transactionId,
    this.userId,
    this.beneficiaryNickname,
    this.amount,
    this.timestamp,
    this.direction,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

extension UserCopyWith on User {
  User copyWith({
    String? id,
    String? name,
    String? phone,
    double? balance,
    double? topupLimit,
    bool? isVerified,
    List<Beneficiary>? beneficiaries,
    List<Transaction>? transactions,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      balance: balance ?? this.balance,
      topupLimit: topupLimit ?? this.topupLimit,
      isVerified: isVerified ?? this.isVerified,
      beneficiaries: beneficiaries ?? this.beneficiaries,
      transactions: transactions ?? this.transactions,
    );
  }
}
