class SemesterCourse {
  int? id;
  String? name;
  String? image;
  String? lecturesSchedule;
  int? watchedVideos;
  int? totalVideos;
  double? percentage;

  SemesterCourse({
    this.id,
    this.name,
    this.image,
    this.lecturesSchedule,
    this.watchedVideos,
    this.totalVideos,
    this.percentage,
  });

  factory SemesterCourse.fromJson(Map<String, dynamic> json) {
    return SemesterCourse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      lecturesSchedule: json['lectures_schedule'] as String?,
      watchedVideos: json['watched_videos'] as int?,
      totalVideos: json['total_videos'] as int?,
      percentage: json['percentage'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'lectures_schedule': lecturesSchedule,
        'watched_videos': watchedVideos,
        'total_videos': totalVideos,
        'percentage': percentage,
      };
}
