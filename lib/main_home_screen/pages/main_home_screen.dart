import 'package:dayonecontacts/main_home_screen/widgets/navbar/home_navbar.dart';
import 'package:dayonecontacts/main_home_screen/widgets/services/services.dart';
import 'package:dayonecontacts/main_home_screen/widgets/visitors_list/home_visitors.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      appBar: CommonHomeNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            HomeVisitors(),
        ServicesHome()
          ],
        ),
      ),
    );
  }
}
