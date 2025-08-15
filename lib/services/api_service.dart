import 'package:http/http.dart' as http;
import '../models/course.dart';

class ApiService {
  static const String _baseUrl = "https://your-api.com";

  static Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse("$_baseUrl/courses"));
    
    if (response.statusCode == 200) {
      return courseFromJson(response.body); // Add JSON parsing in course.dart
    } else {
      throw Exception("Failed to load courses");
    }
  }
}