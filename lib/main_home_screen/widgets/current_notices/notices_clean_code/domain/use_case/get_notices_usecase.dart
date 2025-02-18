import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/core/error/failures.dart';
import '../repositories/notice_repository.dart';
import '../entities/integration.dart';

class GetNoticesUsecase {
  final NoticeRepository repository;

  GetNoticesUsecase(this.repository);

  Future<Either<Failure, Integration>> call() async {
    return await repository.getNotices();
  }
}