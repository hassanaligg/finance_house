class RemoveBeneficiaryRequest {
  final String userId;
  final String beneficiaryId;

  RemoveBeneficiaryRequest({
    required this.userId,
    required this.beneficiaryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'beneficiaryId': beneficiaryId,
    };
  }
}
