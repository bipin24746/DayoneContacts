import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_bloc.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/screens/login_screen.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/core/dependency_injection/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init(); // Initialize service locator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Code Login',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: LoginScreen(),
      ),
    );
  }
}
