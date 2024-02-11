import 'package:dartz/dartz.dart';
import 'package:moton/features/Home/domain/entities/classes_entity.dart';
import 'package:moton/shared/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ClassesEntity>>> fetchClasses();
}
