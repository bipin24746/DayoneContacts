import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/data/data_source/all_notices_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/entities/all_notice_integration.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/repositories/all_notice_repositories.dart';

class AllNoticesRepositoryImplementation implements AllNoticeRepositories{
  final AllNoticeRemoteDataSource allNoticeRemoteDataSource;
  AllNoticesRepositoryImplementation(this.allNoticeRemoteDataSource);

  @override
  Future<Either<Failure, AllNoticesIntegration>> getAllNotices() async {
    try{
      final allNotice = await allNoticeRemoteDataSource.getAllNotices();
      return Right(allNotice);
    }
    catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }
}