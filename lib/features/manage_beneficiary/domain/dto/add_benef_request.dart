class AddBeneficiaryRequest {
  final String userPhone;
  final String beneficiaryPhone;
  final String nickname;

  AddBeneficiaryRequest({
    required this.userPhone,
    required this.beneficiaryPhone,
    required this.nickname,
  });

  Map<String, dynamic> toJson() {
    return {
      'userPhone': userPhone,
      'beneficiaryPhone': beneficiaryPhone,
      'nickname': nickname,
    };
  }
}
