class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String duration;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      duration: json['duration'],
    );
  }
}