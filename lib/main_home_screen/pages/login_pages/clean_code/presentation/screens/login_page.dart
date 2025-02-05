import 'dart:developer';

import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/data_sources/auth_data_sources.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/data/repositories/auth_repo_impl.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/entity/login_entity/auth_entity.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/repositories/auth_repository.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/domain/usecases/auth_usecase.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code/presentation/screens/otp_page.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/pages/otp_verification.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNo = TextEditingController();
  bool isNumFieldValid = false;

  @override
  void initState() {
    super.initState();
    phoneNo.addListener(_numberValidate);
  }

  void _numberValidate() {
    final isValid = phoneNo.text.isNotEmpty &&
        int.tryParse(phoneNo.text) != null &&
        phoneNo.text.length == 10;

    if (isNumFieldValid != isValid) {
      setState(() {
        isNumFieldValid = isValid;
      });
    }
  }

  @override
  void dispose() {
    phoneNo.dispose();
    super.dispose();
  }

  Future<void> performAuth() async {
    // Get the AuthDataSource instance from the provider
    final authDataSource = Provider.of<AuthDataSource>(context, listen: false);

    try {
      // Use the AuthDataSource to call performAuth method
      final result =
          await authDataSource.performAuth(phoneNo: phoneNo.text.trim());
      print("phonenumber:${phoneNo.text.trim()}");
      print("Otp Sent Successfully:${result.authResponseDataEntity?.otp}");
      print("Hash Code:${result.authResponseDataEntity?.hash}");
      // If the result is successful, navigate to the OTP verification screen
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpPage(
                  hash: result.authResponseDataEntity?.hash ?? '',
                  otp: result.authResponseDataEntity?.otp ?? '',
                  phoneNo: phoneNo.text,
                )),
      );
    } catch (e) {
      // Handle errors (e.g., if API call fails)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) =>AuthBloc(authUseCase: AuthUseCase(authRepository: AuthRepositoryImpl(AuthDataSource(Dio())))),




  child: Builder(
    builder: (context) {
      return BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
   if(state is AuthSuccessState){
     log('success');
     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context) => OtpPage(
               hash: state.authResponseEntity.authResponseDataEntity?.hash ?? '',
               otp: state.authResponseEntity.authResponseDataEntity?.otp ?? '',
               phoneNo: phoneNo.text,
             )));

   }else if(state is AuthErrorState){
     log(state.errorMessage);
   }else if (state is AuthLoadingState ){

   }

  },
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
                            controller: phoneNo,
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
                onPressed: (){
                  context.read<AuthBloc>().add(AuthUserEvent(phoneNo: phoneNo.text));
                  
                },

                    // // BlocProvider.of<AuthBloc>(context)()..add(AuthEvent)
                    // : null,
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
        ),
);
    }
  ),
);
  }
}
