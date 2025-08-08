import 'package:finance_house/features/home/data/models/user_model.dart';

class UserData {
  final String id;
  final String name;
  final String phone;
  final double balance;
  final double topupLimit;
  final bool isVerified;
  final Beneficiary beneficiary;

  UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.balance,
    required this.topupLimit,
    required this.isVerified,
    required this.beneficiary,
  });


}
