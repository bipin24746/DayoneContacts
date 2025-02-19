// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dayonecontacts/di/injection.dart' as _i142;
import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/auth_data_sources.dart'
    as _i705;
import 'package:dayonecontacts/features/login_pages/clean_code/data/data_sources/verify_otp_data_source.dart'
    as _i206;
import 'package:dayonecontacts/features/login_pages/clean_code/data/repositories/auth_repo_impl.dart'
    as _i757;
import 'package:dayonecontacts/features/login_pages/clean_code/data/repositories/verify_otp_repo_impl.dart'
    as _i693;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/auth_repository.dart'
    as _i1063;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/repositories/otp_reponse_repo.dart'
    as _i4;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/auth_usecase.dart'
    as _i399;
import 'package:dayonecontacts/features/login_pages/clean_code/domain/usecases/otp_use_case.dart'
    as _i1046;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/login_bloc/auth_bloc.dart'
    as _i358;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/bloc/otp_bloc/otp_verification_bloc.dart'
    as _i605;
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/data_source/all_notices_remote_datasource.dart'
    as _i926;
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/repositories/all_notices_repository_implementation.dart'
    as _i847;
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/repositories/all_notice_repositories.dart'
    as _i491;
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/usecase/get_all_notices_usecases.dart'
    as _i226;
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/presentation/bloc/all_notices_bloc.dart'
    as _i221;
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/data_source/current_flat_remote_datasource.dart'
    as _i140;
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/repositories/curent_flat_repo_impl.dart'
    as _i485;
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/repositories/current_flat_repositories.dart'
    as _i266;
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/usecases/get_current_flat.dart'
    as _i44;
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/presentation/bloc/current_flat_bloc.dart'
    as _i667;
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/data_sources/notice_remote_datasource.dart'
    as _i318;
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/repositories/notice_repository_impl.dart'
    as _i98;
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/domain/repositories/notice_repository.dart'
    as _i712;
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/domain/use_case/get_notices_usecase.dart'
    as _i368;
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/presentation/bloc/notice_bloc.dart'
    as _i359;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i318.NoticeRemoteDataSource>(
        () => _i318.NoticeRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i140.CurrentFlatRemoteDataSource>(
        () => _i140.CurrentFlatRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i926.AllNoticeRemoteDataSource>(
        () => _i926.AllNoticeRemoteDataSourceimpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i266.CurrentRepository>(() =>
        _i485.CurrentFlatRepositoryImpl(
            gh<_i140.CurrentFlatRemoteDataSource>()));
    gh.lazySingleton<_i705.AuthDataSource>(
        () => _i705.AuthDataSourceimpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i206.VerifyOtpDataSource>(
        () => _i206.VerifyOtpDataSourceImpl(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i712.NoticeRepository>(
        () => _i98.NoticeRepositoryImpl(gh<_i318.NoticeRemoteDataSource>()));
    gh.lazySingleton<_i1063.AuthRepository>(() =>
        _i757.AuthRepositoryImpl(authDataSource: gh<_i705.AuthDataSource>()));
    gh.lazySingleton<_i44.GetCurrentFlat>(
        () => _i44.GetCurrentFlat(gh<_i266.CurrentRepository>()));
    gh.lazySingleton<_i4.OtpResponseRepo>(() => _i693.VerifyOtpRepoImpl(
        verifyOtpDataSource: gh<_i206.VerifyOtpDataSource>()));
    gh.lazySingleton<_i491.AllNoticeRepositories>(() =>
        _i847.AllNoticesRepositoryImplementation(
            gh<_i926.AllNoticeRemoteDataSource>()));
    gh.lazySingleton<_i368.GetNoticesUsecase>(
        () => _i368.GetNoticesUsecase(gh<_i712.NoticeRepository>()));
    gh.lazySingleton<_i226.GetAllNoticesUsecase>(
        () => _i226.GetAllNoticesUsecase(gh<_i491.AllNoticeRepositories>()));
    gh.lazySingleton<_i399.AuthUseCase>(
        () => _i399.AuthUseCase(authRepository: gh<_i1063.AuthRepository>()));
    gh.factory<_i667.CurrentFlatBloc>(
        () => _i667.CurrentFlatBloc(getCurrentFlat: gh<_i44.GetCurrentFlat>()));
    gh.factory<_i358.AuthBloc>(() => _i358.AuthBloc(gh<_i399.AuthUseCase>()));
    gh.lazySingleton<_i1046.OtpUseCase>(
        () => _i1046.OtpUseCase(otpResponseRepo: gh<_i4.OtpResponseRepo>()));
    gh.factory<_i359.NoticeBloc>(
        () => _i359.NoticeBloc(getNotices: gh<_i368.GetNoticesUsecase>()));
    gh.factory<_i221.AllNoticeBloc>(() =>
        _i221.AllNoticeBloc(getAllNotices: gh<_i226.GetAllNoticesUsecase>()));
    gh.factory<_i605.OtpVerificationBloc>(
        () => _i605.OtpVerificationBloc(otpUseCase: gh<_i1046.OtpUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i142.RegisterModule {}
