import 'package:dayonecontacts/features/invite_guest/widgets/addManuallyRefractored/SplashScreen.dart';
import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/main_home_screen.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/login_page.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(

      ),
    );
  }
}
