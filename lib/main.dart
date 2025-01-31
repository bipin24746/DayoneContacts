import 'package:dayonecontacts/main_home_screen/pages/login_pages/widgets/pages/login_page.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/data/data_sources/notice_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/domain/use_case/get_notices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'main_home_screen/pages/home_screen_pages/home_screen.dart';
import 'main_home_screen/widgets/current_notices/clean_code/presentation/bloc/notice_bloc.dart';
import 'main_home_screen/widgets/current_notices/clean_code/data/repositories/notice_repository_impl.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => NoticeBloc(
          getNotices: GetNotices(
            NoticeRepositoryImpl(
              NoticeRemoteDataSource(http.Client()),
            ),
          ),
        ),
        child: const LoginPage(), // Your main screen
      ),
    );
  }
}