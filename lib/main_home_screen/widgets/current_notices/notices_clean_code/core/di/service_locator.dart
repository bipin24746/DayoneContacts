// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/data_sources/notice_remote_datasource.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/repositories/notice_repository_impl.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/domain/repositories/notice_repository.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/domain/use_case/get_notices_usecase.dart';
// import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/presentation/bloc/notice_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
//
// final sl = GetIt.instance;
//
// void init(){
//   sl.registerLazySingleton<Dio>(() => Dio());
//
//   sl.registerLazySingleton<NoticeRemoteDataSource>(() => NoticeRemoteDataSource(sl()));
//
//   sl.registerLazySingleton<NoticeRepository>(() => NoticeRepositoryImpl(sl()));
//
//   sl.registerLazySingleton<GetNoticesUsecase>(() => GetNoticesUsecase(sl()));
//
//   sl.registerLazySingleton<NoticeBloc>(() => NoticeBloc(getNotices: sl()));
//
//
// }
//
