import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/core/error/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/data/data_sources/notice_remote_datasource.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/notice_repository.dart';
import '../../domain/entities/integration.dart';


@LazySingleton(as: NoticeRepository)
class NoticeRepositoryImpl implements NoticeRepository {
  final NoticeRemoteDataSource remoteDataSource;

  NoticeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Integration>> getNotices() async {
    try {
      final notices = await remoteDataSource.getNotices();
      return Right(notices);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}