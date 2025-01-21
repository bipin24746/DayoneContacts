import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationPage extends StatefulWidget {
  final String number;
  const OtpVerificationPage({super.key, required this.number});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController NumField = TextEditingController();
  int _remainingtime = 10;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingtime > 0) {
          _remainingtime--;
        }
      });
    });
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 35,
            ),
          ),
          flexibleSpace: SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(
                image: AssetImage("lib/assets/images/signupimage.png"),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "OTP VERIFICATION",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text("Please enter 6-digit code sent via SMS to"),
            Text(
              '+977 ${widget.number}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.start,
              fieldHeight: 40,
              numberOfFields: 6,
              borderColor: Colors.black,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Resend Code "),
                _remainingtime != 0 ? Text("00 : $_remainingtime") :  TextButton(onPressed: () {

                }, child: Text("data")),
                // Text(_remainingtime != 0 ? "00: $_remainingtime" : "Send Code Again"),
                // if (_remainingtime != 0) ? Text("00: $_remainingtime") :

                // TimerCountdown(
                //   endTime: DateTime.now().add(
                //     Duration(seconds: 10),
                //
                //   ),
                //   format: CountDownTimerFormat.secondsOnly,
                //   onEnd: () {
                //     print("Timer Finished");
                //   },
                // ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {},
            child: Text(
              "Continue",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
