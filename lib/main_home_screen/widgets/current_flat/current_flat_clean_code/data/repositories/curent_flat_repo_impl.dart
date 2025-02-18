import 'package:dartz/dartz.dart';
import 'package:dayonecontacts/core/errors/failures.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/data/data_source/current_flat_remote_datasource.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/entity/integration.dart';
import 'package:dayonecontacts/main_home_screen/widgets/current_flat/current_flat_clean_code/domain/repositories/current_flat_repositories.dart';

class CurrentFlatRepositoryImpl implements CurrentRepository{
  final CurrentFlatRemoteDataSource remoteDataSource;
  CurrentFlatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure,CurrentFlatIntegration>> getDataFlat() async{
    try{
      final current_flat = await remoteDataSource.getDataFlat();
      return Right(current_flat);
    }
    catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}