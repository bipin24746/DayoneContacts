import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/entities/all_notice_integration.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/repositories/all_notice_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllNoticesUsecase {
  final AllNoticeRepositories allNoticeRepositories;
  GetAllNoticesUsecase(this.allNoticeRepositories);

  Future<Either<Failure, AllNoticesIntegration>> call() async {
    return await allNoticeRepositories.getAllNotices();
  }
}
