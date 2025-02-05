import 'dart:async';
import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatefulWidget {
  final String hash;
  final String otp;
  final String phoneNo;

  const OtpPage({
    Key? key,
    required this.hash,
    required this.otp,
    required this.phoneNo,
  }) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late Timer _timer;
  int _remainingTime = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: 35,
            ),
          ),
          flexibleSpace: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset("lib/assets/images/signupimage.png"),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("OTP VERIFICATION",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Text("Please enter the 6-digit code sent via SMS to"),
            Text('+977 ${widget.phoneNo}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.start,
              numberOfFields: 6,
              borderColor: Colors.black,
              showFieldAsBox: true,
              onSubmit: (code) {
                // Handle OTP submission
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Resend Code "),
                if (_remainingTime > 0)
                  Text("00:$_remainingTime")
                else
                  TextButton(
                    onPressed: () {
                      // Implement Resend OTP functionality here
                    },
                    child: const Text("Resend OTP"),
                  ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreenMain()),
            );
          },
          child: const Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
