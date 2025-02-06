import 'dart:async';
import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/data_sources/verify_otp_data_source.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/repositories/verify_otp_repo_impl.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/usecases/otp_use_case.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/presentation/bloc/otp_bloc/otp_verification_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatefulWidget {
  final String phoneNo;
  final String hash;
  final String otp;

  const OtpPage({
    Key? key,
    required this.phoneNo,
    required this.hash,
    required this.otp,
  }) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _otpVerified = TextEditingController();
  bool _isotpValid = false;

  int _remainingTime = 30;

  @override
  void initState() {
    super.initState();
    _otpVerified.addListener(_validateOtp);
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _validateOtp() {
    final isValid = _otpVerified.text.isNotEmpty &&
        int.tryParse(_otpVerified.text) != null &&
        _otpVerified.text.length == 6; // Correcting length to 6

    if (_isotpValid != isValid) {
      setState(() {
        _isotpValid = isValid;
      });
    }
  }

  void _resendOtp() {
    setState(() {
      _remainingTime = 30; // Resetting the timer
    });
    // Implement the logic to resend the OTP here
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpVerificationBloc(
        otpUseCase: OtpUseCase(
          otpResponseRepo: VerifyOtpRepoImpl(
            verifyOtpDataSource: VerifyOtpDataSourceImpl(
              dio: Dio(),
            ),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
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
              const Text(
                "OTP VERIFICATION",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text("Please enter the 6-digit code sent via SMS to"),
              Text(
                '+977 ${widget.phoneNo}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.start,
                numberOfFields: 6,
                borderColor: Colors.black,
                showFieldAsBox: true,
                onSubmit: (code) => _otpVerified.text = code,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Resend Code "),
                  if (_remainingTime > 0)
                    Text("00:$_remainingTime")
                  else
                    TextButton(
                      onPressed: _resendOtp,
                      child: const Text("Resend OTP"),
                    ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Builder(builder: (context) {
            return BlocListener<OtpVerificationBloc, OtpVerificationState>(
              listener: (context, state) {
                if (state is OtpVerificationSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Otp Verified Successfully."),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreenMain(),
                    ),
                  );
                } else if (state is OtpVerificationErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('OTP Error: ${state.errorMessage}'),
                    ),
                  );
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Button enabled always
                ),
                onPressed: _isotpValid
                    ? () {
                        context.read<OtpVerificationBloc>().add(
                              OtpVerificationUserEvent(
                                phoneNo: widget.phoneNo,
                                otp: _otpVerified.text, // Using user input OTP
                                hash: widget.hash,
                                fcmToken:
                                    'fhCbQpQSQCKFH5pIXRl8aL:APA91bFQurQq0hivgZGZ3A3QI4IkZojznFPgtskZsvVh16aSnl56JkquQVMddRq3QNSIJe7qv4YlxI7Uv-N_YsxqeYb4_1Wy551BYzCFJCObDXZE-VzLtIhp1iBBy8nv-PyTTKTx1apL', // Replace with actual FCM token

                                deviceId:
                                    '04762b6a13fe52fb', // Replace with actual device ID
                                deviceType:
                                    'android', // Replace with actual device type
                              ),
                            );
                      }
                    : null,
                child:
                    const Text("Login", style: TextStyle(color: Colors.white)),
              ),
            );
          }),
        ),
      ),
    );
  }
}
