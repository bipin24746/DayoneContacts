

import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/data/datasources/auth_remote_data_source.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/data/repositories/auth_repository_impl.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/repositories/auth_repository.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/usecases/send_otp.dart';
import 'package:dayonecontacts/main_home_screen/pages/clean_code_login_page/domain/usecases/verify_otp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl(getIt<Dio>()));
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));
  getIt.registerSingleton<SendOtp>(SendOtp(getIt<AuthRepository>()));
  getIt.registerSingleton<VerifyOtp>(VerifyOtp(getIt<AuthRepository>()));
  getIt.init();
}