// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/login_pages/clean_code/data/data_sources/auth_data_sources.dart'
    as _i736;
import '../features/login_pages/clean_code/data/data_sources/verify_otp_data_source.dart'
    as _i107;
import '../features/login_pages/clean_code/data/repositories/auth_repo_impl.dart'
    as _i907;
import '../features/login_pages/clean_code/data/repositories/verify_otp_repo_impl.dart'
    as _i419;
import '../features/login_pages/clean_code/domain/repositories/auth_repository.dart'
    as _i346;
import '../features/login_pages/clean_code/domain/repositories/otp_reponse_repo.dart'
    as _i853;
import '../features/login_pages/clean_code/domain/usecases/auth_usecase.dart'
    as _i513;
import '../features/login_pages/clean_code/domain/usecases/otp_use_case.dart'
    as _i622;
import '../features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart'
    as _i216;
import '../features/login_pages/clean_code/presentation/bloc/otp_bloc/otp_verification_bloc.dart'
    as _i822;
import '../main_home_screen/widgets/current_flat/current_flat_clean_code/data/data_source/current_flat_remote_datasource.dart'
    as _i735;
import '../main_home_screen/widgets/current_flat/current_flat_clean_code/data/repositories/curent_flat_repo_impl.dart'
    as _i833;
import '../main_home_screen/widgets/current_flat/current_flat_clean_code/domain/repositories/current_flat_repositories.dart'
    as _i931;
import '../main_home_screen/widgets/current_flat/current_flat_clean_code/domain/usecases/get_current_flat.dart'
    as _i529;
import '../main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/bloc/current_flat_bloc.dart'
    as _i2;
import '../main_home_screen/widgets/current_notices/notices_clean_code/data/data_sources/notice_remote_datasource.dart'
    as _i344;
import '../main_home_screen/widgets/current_notices/notices_clean_code/data/repositories/notice_repository_impl.dart'
    as _i307;
import '../main_home_screen/widgets/current_notices/notices_clean_code/domain/repositories/notice_repository.dart'
    as _i324;
import '../main_home_screen/widgets/current_notices/notices_clean_code/domain/use_case/get_notices_usecase.dart'
    as _i674;
import '../main_home_screen/widgets/current_notices/notices_clean_code/presentation/bloc/notice_bloc.dart'
    as _i361;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i344.NoticeRemoteDataSource>(
        () => _i344.NoticeRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i735.CurrentFlatRemoteDataSource>(
        () => _i735.CurrentFlatRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i931.CurrentRepository>(() =>
        _i833.CurrentFlatRepositoryImpl(
            gh<_i735.CurrentFlatRemoteDataSource>()));
    gh.lazySingleton<_i736.AuthDataSource>(
        () => _i736.AuthDataSourceimpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i107.VerifyOtpDataSource>(
        () => _i107.VerifyOtpDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i324.NoticeRepository>(
        () => _i307.NoticeRepositoryImpl(gh<_i344.NoticeRemoteDataSource>()));
    gh.lazySingleton<_i346.AuthRepository>(() =>
        _i907.AuthRepositoryImpl(authDataSource: gh<_i736.AuthDataSource>()));
    gh.lazySingleton<_i529.GetCurrentFlat>(
        () => _i529.GetCurrentFlat(gh<_i931.CurrentRepository>()));
    gh.lazySingleton<_i853.OtpResponseRepo>(() => _i419.VerifyOtpRepoImpl(
        verifyOtpDataSource: gh<_i107.VerifyOtpDataSource>()));
    gh.lazySingleton<_i674.GetNoticesUsecase>(
        () => _i674.GetNoticesUsecase(gh<_i324.NoticeRepository>()));
    gh.lazySingleton<_i513.AuthUseCase>(
        () => _i513.AuthUseCase(authRepository: gh<_i346.AuthRepository>()));
    gh.factory<_i2.CurrentFlatBloc>(
        () => _i2.CurrentFlatBloc(getCurrentFlat: gh<_i529.GetCurrentFlat>()));
    gh.lazySingleton<_i622.OtpUseCase>(
        () => _i622.OtpUseCase(otpResponseRepo: gh<_i853.OtpResponseRepo>()));
    gh.factory<_i361.NoticeBloc>(
        () => _i361.NoticeBloc(getNotices: gh<_i674.GetNoticesUsecase>()));
    gh.factory<_i216.AuthBloc>(
        () => _i216.AuthBloc(authUseCase: gh<_i513.AuthUseCase>()));
    gh.factory<_i822.OtpVerificationBloc>(
        () => _i822.OtpVerificationBloc(otpUseCase: gh<_i622.OtpUseCase>()));
    return this;
  }
}
