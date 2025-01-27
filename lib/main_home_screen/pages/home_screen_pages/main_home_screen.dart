import 'package:dayonecontacts/main_home_screen/widgets/bottom_navbar_home/bottom_nav_bar_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/connect_home/connect_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/api_data/api_services.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/current_notices_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/navbar/home_navbar.dart';
import 'package:dayonecontacts/main_home_screen/widgets/ongoing_polls/ongoing_polls.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/personal_staff.dart';
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
      bottomNavigationBar: BottomNavBarHome(),
    );
  }
}
