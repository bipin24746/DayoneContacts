import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';

abstract class CurrentRepository{
  Future<Either<Failure,CurrentFlatIntegration>> getDataFlat();
}