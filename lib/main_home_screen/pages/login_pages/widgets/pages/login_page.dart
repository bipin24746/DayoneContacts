import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/api_response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'otp_verification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  // bool isLoading = false;
  bool isNumFieldValid = false;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_numberValidate);
  }

  void _numberValidate() {
    final isValid = phoneController.text.isNotEmpty &&
        int.tryParse(phoneController.text) != null &&
        phoneController.text.length == 10;

    if (isNumFieldValid != isValid) {
      setState(() {
        isNumFieldValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  Future<void> sendOtp() async {
    // Dio instance
    Dio dio = Dio();

    final url = 'https://housing-stagingserver.aitc.ai/api/v1/client/auth';

    // Set the request headers
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    try {
      // Send POST request using dio
      final response = await dio.post(
        url,
        data: jsonEncode({'contact': phoneController.text}),
      );

      // Check if the response status code is 200 (Success)
      if (response.statusCode == 200) {
        // Decode the response data
        final responseData = response.data;

        // Parse the response data to LoginResponse model
        final loginResponse = LoginResponse.fromJson(responseData);

        if (loginResponse.success) {
          print('OTP sent successfully: ${loginResponse.data.otp}');
          print('Hash: ${loginResponse.data.hash}');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpVerificationPage(
                phone: loginResponse.data.phone,
                hash: loginResponse.data.hash,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(loginResponse.message)),
          );
        }
      } else {
        // Handle server error if statusCode isn't 200
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send OTP. Please try again.')),
        );
      }
    } catch (e) {
      // Handle any errors during the request (network, timeout, etc.)
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong. Please try again.')),
      );
    }
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
              child: Image(
                image: AssetImage("lib/assets/images/signupimage.png"),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BEGIN YOUR JOURNEY TO HOME",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Please enter your mobile number to create your account.",
                style: TextStyle(fontSize: 12),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.flag,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: isNumFieldValid ? sendOtp : null,
            child: const Text(
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
