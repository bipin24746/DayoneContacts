import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/data/repositories/auth_repository.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/core/network/api_client.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/domain/usecases/login_usecase.dart';
import 'package:dayonecontacts/main_home_screen/pages/login_pages/clean_code_login/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance; // Service locator instance

void init() {
  // Registering the AuthRepository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(apiClient: sl<ApiClient>()));

  // Registering the LoginUseCase correctly
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl<AuthRepository>()));


  // Register BLoC
  // Correct the registration to avoid positional arguments.
  sl.registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: sl<LoginUseCase>()));


}
