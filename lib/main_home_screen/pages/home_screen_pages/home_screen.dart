import 'package:dayonecontacts/main_home_screen/widgets/connect_home/connect_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/data/data_sources/notice_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/data/repositories/notice_repository_impl.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/domain/use_case/get_notices.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/presentation/bloc/notice_bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/presentation/pages/current_notices.dart';
import 'package:dayonecontacts/main_home_screen/widgets/ongoing_polls/ongoing_polls.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/personal_staff.dart';
import 'package:dayonecontacts/main_home_screen/widgets/services/services.dart';
import 'package:dayonecontacts/main_home_screen/widgets/visitors_list/home_visitors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeVisitors(),
          ServicesHome(),
          PersonalStaffHome(),
          const SizedBox(height: 30),
          BlocProvider(
            create: (context) => NoticeBloc(
              getNotices: GetNotices(
                NoticeRepositoryImpl(
                  NoticeRemoteDataSource(http.Client()),
                ),
              ),
            ),
            child: const CurrentNoticeHome(), // Provide NoticeBloc here
          ),
          OngoingPollsHome(),
          ConnectHomeContainer(),
        ],
      ),
    );
  }
}