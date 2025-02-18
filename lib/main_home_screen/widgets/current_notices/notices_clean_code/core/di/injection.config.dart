// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
    gh.lazySingleton<_i318.NoticeRemoteDataSource>(
        () => _i318.NoticeRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i712.NoticeRepository>(
        () => _i98.NoticeRepositoryImpl(gh<_i318.NoticeRemoteDataSource>()));
    gh.lazySingleton<_i368.GetNoticesUsecase>(
        () => _i368.GetNoticesUsecase(gh<_i712.NoticeRepository>()));
    gh.factory<_i359.NoticeBloc>(
        () => _i359.NoticeBloc(getNotices: gh<_i368.GetNoticesUsecase>()));
    return this;
  }
}
