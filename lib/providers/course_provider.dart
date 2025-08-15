import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course.dart';

final courseProvider = StateNotifierProvider<CourseNotifier, List<Course>>((ref) => CourseNotifier());

class CourseNotifier extends StateNotifier<List<Course>> {
  CourseNotifier() : super([]);

  void loadCourses() async {
    state = await ApiService.fetchCourses(); // Will implement next
  }
}