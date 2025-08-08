class SendMoneyRequest {
  final String userId;
  final String beneficiaryId;
  final int amount;

  SendMoneyRequest({
    required this.userId,
    required this.beneficiaryId,
    required this.amount,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'beneficiaryId': beneficiaryId,
      'amount': amount,
    };
  }
}
