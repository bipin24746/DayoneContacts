import 'dart:async';
import 'dart:convert';
import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/api_response/otp_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

class OtpVerificationPage extends StatefulWidget {
  //phone and hash are passed from the previous page(where user entered their phone number and received the OTP).
  final String phone;
  final String hash;


  const OtpVerificationPage({
    Key? key,
    required this.phone,
    required this.hash,
  }) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  late Timer _timer;
  int _remainingTime = 30;
  final Dio _dio = Dio();

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
    _otpController.dispose();
    super.dispose();
  }



  Future<void> _verifyOtp() async {
    final String otp = _otpController.text.trim();

    if (otp.isEmpty || otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
      );
      return;
    }


//preparing the data that will be sent to the server to verify the otp.

    //endpoint where otp verification request is sent
    final url =
        'https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify';

    //requestbody : a map that holds the data we're sending to the server.
    final requestBody = {
      'hash': widget.hash, //a unique hash which receiver during the OTP sending process, it is used by the server to associate the otp with the correct request.
      'otp': otp, //otp entered by the user.
      'phone': widget.phone, //the phone number on which the otp was sent, which is also passed from the previous screen.
      'deviceType': 'android', // specifies the device type.
      //these are optional may be
      'deviceId': '04762b6a13fe52fb',
      'fcmToken':
          'fhCbQpQSQCKFH5pIXRl8aL:APA91bFQurQq0hivgZGZ3A3QI4IkZojznFPgtskZsvVh16aSnl56JkquQVMddRq3QNSIJe7qv4YlxI7Uv-N_YsxqeYb4_1Wy551BYzCFJCObDXZE-VzLtIhp1iBBy8nv-PyTTKTx1apL', // Replace with actual FCM token
    };

    try {

      //dio library used to make an HTTP POST request to the server.
      final response = await _dio.post(
        url, //endpoint to send request
        data: jsonEncode(requestBody), //requestbody is encoded into json format(jsonencoded(requestbody)), because the server expects data in json format.

        // request headers are set to specify that the data being sent is in JSON format ('Content-Type': 'application/json').
        options: Options(
          headers: {'Content-Type': 'application/json'},//sending the data into json format.
        ),
      );
      if (response.statusCode == 201) {
        final responseData = response.data; //if status code is 201. the response data extracted into responseData.this data will be in form of json and contains the result of the otp verification.

        final otpResponse = OtpResponse.fromJson(responseData);


        print('Mapped Model: $responseData');
        if (otpResponse.success) {
          //save token to sharedpreferences
          final prefs = await SharedPreferences.getInstance();

          final String? accessToken = otpResponse.data.accessToken;

          if (accessToken != null && accessToken.isNotEmpty) {
            // Save the accessToken to SharedPreferences
            final prefs = await SharedPreferences.getInstance();

            await prefs.setString('authToken', accessToken);
            // Save the token
            final authtoken = prefs.getString('authToken');
            print('accesstoken:$accessToken');
            print('Token saved: $accessToken');

          } else {
            // Handle the case where accessToken is null or empty
            print('Access token is null or empty, cannot save');
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(otpResponse.message)),
          );
          Navigator.pushReplacement(

            context,
            MaterialPageRoute(builder: (context) => const HomeScreenMain()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(otpResponse.message)),
          );
        }
      } else {
        throw Exception('it is Failed to verify OTP. Please try again.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  //api using http
  // Future<void> _verifyOtp() async {
  //   final String otp = _otpController.text.trim();
  //
  //   if (otp.isEmpty || otp.length != 6) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
  //     );
  //     return;
  //   }
  //
  //   final url = Uri.parse('https://housing-stagingserver.aitc.ai/api/v1/client/otp/verify');
  //   final requestBody = {
  //     'hash': widget.hash,
  //     'otp': otp,
  //     'phone': widget.phone,
  //     'deviceType': 'android',
  //     //these are optional may be
  //     'deviceId': '04762b6a13fe52fb',
  //     'fcmToken': 'fhCbQpQSQCKFH5pIXRl8aL:APA91bFQurQq0hivgZGZ3A3QI4IkZojznFPgtskZsvVh16aSnl56JkquQVMddRq3QNSIJe7qv4YlxI7Uv-N_YsxqeYb4_1Wy551BYzCFJCObDXZE-VzLtIhp1iBBy8nv-PyTTKTx1apL', // Replace with actual FCM token
  //
  //   };
  //
  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(requestBody),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       final responseData = jsonDecode(response.body);
  //       if (responseData['success'] == true) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(responseData['message'])),
  //         );
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => const HomeScreenMain()),
  //         );
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(responseData['message'])),
  //         );
  //       }
  //     } else {
  //       throw Exception('Failed to verify OTP. Please try again.');
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error: $e')),
  //     );
  //   }
  // }

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
              child: Image(
                image: AssetImage("lib/assets/images/signupimage.png"),
              ),
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
            Text('+977 ${widget.phone}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.start,
              numberOfFields: 6,
              borderColor: Colors.black,
              showFieldAsBox: true,
              onSubmit: (code) => _otpController.text = code,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Resend Code "),
                if (_remainingTime > 0)
                  Text("00:$_remainingTime")
                else
                  Text("Resend Otp"
                      // onPressed: _resendOtp,
                      // child: const Text("Resend"),
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
          onPressed: _verifyOtp,
          child: const Text("Continue", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
