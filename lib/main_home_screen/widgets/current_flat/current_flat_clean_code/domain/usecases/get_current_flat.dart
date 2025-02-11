import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/repositories/current_flat_repositories.dart';

class GetCurrentFlat{
  final CurrentRepository repository;
  GetCurrentFlat(this.repository);

  Future<Either<Failure,CurrentFlatIntegration>> call() async{
    return await repository.getDataFlat();
  }
}