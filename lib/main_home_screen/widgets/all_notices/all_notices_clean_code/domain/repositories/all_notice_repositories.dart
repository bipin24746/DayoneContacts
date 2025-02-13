import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/domain/entities/all_notice_integration.dart';

abstract class AllNoticeRepositories{
  Future<Either<Failure,AllNoticesIntegration>> getAllNotices();
}