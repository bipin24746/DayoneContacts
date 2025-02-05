import 'dart:developer';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/presentation/bloc/login_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/presentation/bloc/login_event.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/presentation/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/pages/otp_verification.dart';

import 'package:dio/dio.dart'; // Import Dio
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/datasources/login_remote_data_source.dart'; // Import LoginRemoteDataSourceImpl
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/repositories/login_repository_impl.dart'; // Import LoginRepositoryImpl
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/domain_usecases/send_otp_usecase.dart'; // Import SendOtpUseCaseImpl
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/domain_usecases/phone_validation_usecase.dart'; // Import PhoneValidationUseCase

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneControl = TextEditingController();  // Controller for phone input

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        sendOtpUseCase: SendOtpUseCaseImpl(LoginRepositoryImpl(LoginRemoteDataSourceImpl(Dio()))),
        phoneValidationUseCase: PhoneValidationUseCase(),
        loginRemoteDataSource: LoginRemoteDataSourceImpl(Dio()), // Provide the required loginRemoteDataSource
      ),
      child: Scaffold(
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
                          controller: phoneControl,
                          onChanged: (phoneNumber) {
                            // Dispatch the PhoneNumberChanged event whenever the phone number changes
                            context.read<LoginBloc>().add(PhoneNumberChanged(phoneNumber));
                          },
                          decoration: InputDecoration(
                            labelText: "Mobile Number",
                            floatingLabelStyle: const TextStyle(color: Colors.black),
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
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    print('Current state: $state'); // Debugging line

                    bool isNumFieldValid = false;
                    if (state is PhoneNumberValid) {
                      isNumFieldValid = true; // Mark the field as valid
                    }

                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                            onPressed: () {
                              log("Sending OTP...");

                              // Only navigate to OTP page when OtpSent state is triggered
                              if (state is OtpSent) {
                                print('OTP sent successfully: ${state.otp}');
                                print('Hash: ${state.hash}');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpVerificationPage(
                                      otp: state.otp,
                                      hash: state.hash,
                                      phone: phoneControl.text,  // Pass phoneControl.text to OTP page
                                    ),
                                  ),
                                );
                              }

                              // Trigger SendOtpRequested when phone number is valid
                              if (state is PhoneNumberValid) {
                                final phoneNumber = phoneControl.text;
                                BlocProvider.of<LoginBloc>(context).add(SendOtpRequested(phoneNumber));
                              }
                            },
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
                  },
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is OtpSent) {
                      // Print for debugging
                      print("OTP sent successfully: ${state.otp}");
                      print("Hash: ${state.hash}");

                      // Now navigate to the OTP verification page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerificationPage(
                            otp: state.otp,
                            hash: state.hash,
                            phone: phoneControl.text, // Passing the phone number to the OTP page
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
