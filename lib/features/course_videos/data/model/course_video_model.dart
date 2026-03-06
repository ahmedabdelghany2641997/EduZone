class CourseVideoModel {
  final String id;

  final String title;

  final String desc;

  final String url;

  CourseVideoModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.url,
  });

  factory CourseVideoModel.fromJson(Map<String, dynamic> json) {
    return CourseVideoModel(
      id: json["id"],
      title: json["title"],
      desc: json["desc"],
      url: json["video_url"],
    );
  }
}
