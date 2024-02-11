import 'package:dartz/dartz.dart';
import 'package:moton/features/Home/domain/entities/classes_entity.dart';

import 'package:moton/features/Home/domain/repositories/home_repo.dart';
import 'package:moton/shared/errors/failure.dart';

class FetchHomeUsecase extends Usecase<List<ClassesEntity>> {
  final HomeRepo homeRepo;

  FetchHomeUsecase(this.homeRepo);

  @override
  Future<Either<Failure, List<ClassesEntity>>> excute() async {
    return await homeRepo.fetchClasses();
  }
}

abstract class Usecase<Type> {
  Future<Either<Failure, Type>> excute();
}
