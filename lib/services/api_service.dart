import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/course.dart';

class ApiService {
  static const String _baseUrl = "https://your-api.com";
  static const Duration timeout = Duration(seconds: 10);

  static Future<List<Course>> fetchCourses() async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/courses"),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load courses: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}