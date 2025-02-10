



import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/clean_code/core/error/failures.dart';

import '../entities/integration.dart';

abstract class NoticeRepository {
  Future<Either<Failure, Integration>> getNotices();
}