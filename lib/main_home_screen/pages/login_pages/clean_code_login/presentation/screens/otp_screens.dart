import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final String hash;

  OtpScreen({required this.phoneNumber, required this.hash});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Verify OTP")),
      body: Center(
        child: Text("Enter OTP sent to $phoneNumber"),
      ),
    );
  }
}
