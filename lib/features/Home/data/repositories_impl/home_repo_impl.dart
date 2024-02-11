import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moton/features/Home/data/data_sources/home_remote_data_source.dart';
import 'package:moton/features/Home/domain/entities/classes_entity.dart';
import 'package:moton/features/Home/domain/repositories/home_repo.dart';
import 'package:moton/shared/errors/failure.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<ClassesEntity>>> fetchClasses() async {
    try {
      var semsters = await homeRemoteDataSource.fetchClasses();

      return right(semsters);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
