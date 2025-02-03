import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/otp_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/otp_event.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/otp_state.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String hash;

  const VerifyOtpScreen({
    Key? key,
    required this.phoneNumber,
    required this.hash,
  }) : super(key: key);

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Verify OTP"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter the OTP sent to ${widget.phoneNumber}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            BlocConsumer<OtpBloc, OtpState>(
              listener: (context, state) {
                if (state is OtpSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreenMain()),
                  );
                } else if (state is OtpFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: () {
                      final otp = _otpController.text.trim();
                      if (otp.isNotEmpty) {
                        context.read<OtpBloc>().add(
                          VerifyOtp(
                            phoneNumber: widget.phoneNumber,
                            otp: otp,
                            hash: widget.hash,
                          ),
                        );
                      }
                    },
                    child: state is OtpLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                      "Verify OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
