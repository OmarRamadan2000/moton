import 'package:moton/features/Home/data/models/year_semesters/year_semesters.dart';
import 'package:moton/features/Home/domain/entities/classes_entity.dart';
import 'package:moton/shared/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<ClassesEntity>> fetchClasses();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ClassesEntity>> fetchClasses() async {
    var data = await apiService.get(endPoint: '/home-screen/');

    List<ClassesEntity> yearsemesters = getsemestersList(data);

    return yearsemesters;
  }

  List<ClassesEntity> getsemestersList(Map<String, dynamic> data) {
    List<ClassesEntity> semesters = [];
    for (var classes in data["data"]["year_semesters"]) {
      semesters.add(YearSemesters.fromJson(classes));
    }
    print(semesters[0]);
    return semesters;
  }
}
