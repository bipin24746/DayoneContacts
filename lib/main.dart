import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/datasources/login_remote_data_source.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/data/repositories/login_repository_impl.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/domain_usecases/phone_validation_usecase.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/domain/domain_usecases/send_otp_usecase.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/presentation/bloc/login_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_login/presentation/screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => LoginBloc(
          sendOtpUseCase: SendOtpUseCase(
            LoginRepositoryImpl(LoginRemoteDataSourceImpl(Dio())),
          ),
          phoneValidationUseCase: PhoneValidationUseCase(),
        ),
        child: const LoginPage(),
      ),
    );
  }
}
