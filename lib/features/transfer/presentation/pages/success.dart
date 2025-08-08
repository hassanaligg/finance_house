import 'package:flutter/material.dart';

/*onPressed: () {
final topUpData = {
  'amount': 100,
  'beneficiaryName': 'John Doe',
  'balanceAfter': 2900,
};
context.go(
AppRoute.topUpSucess,
extra: topUpData,
);
},*/
class SuccessTopUpScreen extends StatelessWidget {
  final double amount;
  final String beneficiaryName;
  final double balanceAfter;

  SuccessTopUpScreen({
    required this.amount,
    required this.beneficiaryName,
    required this.balanceAfter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Top-Up Successful!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'You have topped up AED $amount for $beneficiaryName.',
                style: TextStyle(fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.green.shade50,
                child: ListTile(
                  leading: Icon(Icons.account_balance_wallet, color: Colors.green),
                  title: Text('Your new balance'),
                  subtitle: Text('AED $balanceAfter',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the main screen
                },
                child: Text('Return to Dashboard'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
