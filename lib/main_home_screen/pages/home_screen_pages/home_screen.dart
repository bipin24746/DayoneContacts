import 'package:dayonecontacts/main_home_screen/widgets/connect_home/connect_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/current_notices_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/ongoing_polls/ongoing_polls.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/personal_staff.dart';
import 'package:dayonecontacts/main_home_screen/widgets/services/services.dart';
import 'package:dayonecontacts/main_home_screen/widgets/visitors_list/home_visitors.dart';
import 'package:flutter/material.dart';

class HomeScreenMain extends StatefulWidget {
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [

          HomeVisitors(),
          ServicesHome(),
          PersonalStaffHome(),
          SizedBox(height: 30,),
          CurrentNoticesHome(),
          OngoingPollsHome(),
          ConnectHomeContainer(),
        ],
      ),
    ),);
  }
}
