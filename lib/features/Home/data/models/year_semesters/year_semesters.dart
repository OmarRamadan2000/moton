import 'package:moton/features/Home/domain/entities/classes_entity.dart';

import 'semester_course.dart';

class YearSemesters extends ClassesEntity {
  int? id;
  String? name;
  List<SemesterCourse>? semesterCourses;
  String? date;
  int? watchedVideos;
  int? totalVideos;
  double? percentage;
  bool? active;
  bool? done;
  String? description;

  YearSemesters({
    this.id,
    this.name,
    this.semesterCourses,
    this.date,
    this.watchedVideos,
    this.totalVideos,
    this.percentage,
    this.active,
    this.done,
    this.description,
  }) : super(nameSemester: name, idSemester: id, info: semesterCourses);

  factory YearSemesters.fromJson(Map<String, dynamic> json) => YearSemesters(
        id: json['id'] as int?,
        name: json['name'] as String?,
        semesterCourses: (json['semester_courses'] as List<dynamic>?)
            ?.map((e) => SemesterCourse.fromJson(e as Map<String, dynamic>))
            .toList(),
        date: json['date'] as String?,
        watchedVideos: json['watched_videos'] as int?,
        totalVideos: json['total_videos'] as int?,
        percentage: json['percentage'] as double?,
        active: json['active'] as bool?,
        done: json['done'] as bool?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'semester_courses': semesterCourses?.map((e) => e.toJson()).toList(),
        'date': date,
        'watched_videos': watchedVideos,
        'total_videos': totalVideos,
        'percentage': percentage,
        'active': active,
        'done': done,
        'description': description,
      };
}
