import 'package:auto_route/annotations.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/data_source/all_notices_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/repositories/all_notices_repository_implementation.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/usecase/get_all_notices_usecases.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/presentation/bloc/all_notices_bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/presentation/screens/all_notices_clean.dart';
import 'package:dayonecontacts/main_home_screen/widgets/connect_home/connect_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/data_source/current_flat_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/repositories/curent_flat_repo_impl.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/usecases/get_current_flat.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/bloc/current_flat_bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/screens/current_flat_clean.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/current_notices_home.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/data_sources/notice_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/repositories/notice_repository_impl.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/domain/use_case/get_notices_usecase.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/presentation/bloc/notice_bloc.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/presentation/pages/current_notices.dart';
import 'package:dayonecontacts/main_home_screen/widgets/ongoing_polls/ongoing_polls.dart';
import 'package:dayonecontacts/main_home_screen/widgets/personal_staff/personal_staff.dart';
import 'package:dayonecontacts/main_home_screen/widgets/services/services.dart';
import 'package:dayonecontacts/main_home_screen/widgets/visitors_list/home_visitors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

@RoutePage()

class HomeScreenMain extends StatelessWidget {
  const HomeScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoticeBloc(
            getNotices: GetNoticesUsecase(
              NoticeRepositoryImpl(
                NoticeRemoteDataSource(Dio()),
              ),
            ),
          )..add(FetchNotices()),
        ),
        BlocProvider(
            create: (context) => CurrentFlatBloc(
                  getCurrentFlat: GetCurrentFlat(
                    CurrentFlatRepositoryImpl(
                      CurrentFlatRemoteDataSource(
                        http.Client(),
                      ),
                    ),
                  ),
                )..add(FetchCurrentFlat())),

      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: ListView(
            children: [
              HomeVisitors(),
              ServicesHome(),
              PersonalStaffHome(),
              // CurrentNoticesHome(),
              SizedBox(height: 30), // Add spacing between widgets
              const CurrentNoticeHome(), // BlocProvider for NoticeBloc
              OngoingPollsHome(),
              ConnectHomeContainer(),
              // CurrentFlatUI(),
              CurrentFlatClean(),
              // AllNoticesClean()// This is where you add CurrentFlatClean
            ],
          ),
        );
      }),
    );
  }
}
