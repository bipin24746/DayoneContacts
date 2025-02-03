import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_event.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_state.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/screens/otp_screens.dart'; // Assuming you have this screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool isNumFieldValid = false;



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
              child: Image.asset(
                "lib/assets/images/signupimage.png", // Your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
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
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            isNumFieldValid = value.isNotEmpty;
                          });
                        },
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
            onPressed: isNumFieldValid
                ? () {
              final phoneNumber = _phoneController.text.trim();
              if (phoneNumber.isNotEmpty) {
                // Trigger OTP request event in LoginBloc
                context.read<LoginBloc>().add(LoginRequestOtp(phoneNumber: phoneNumber));
              }
            }
                : null,
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return CircularProgressIndicator(color: Colors.white);
                }
                return const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),

        ),
      ),
    );
  }
}
