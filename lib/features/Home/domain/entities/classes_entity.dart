import 'package:moton/features/Home/data/models/year_semesters/semester_course.dart';

class ClassesEntity {
  final String? nameSemester;
  final int? idSemester;
  final List<SemesterCourse>? info;

  ClassesEntity(
      {required this.nameSemester,
      required this.idSemester,
      required this.info});
}
