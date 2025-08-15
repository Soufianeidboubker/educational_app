import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course.dart';
import '../services/api_service.dart';

final courseProvider = StateNotifierProvider<CourseNotifier, AsyncValue<List<Course>>>((ref) => CourseNotifier());

class CourseNotifier extends StateNotifier<AsyncValue<List<Course>>> {
  CourseNotifier() : super(const AsyncValue.loading()) {
    loadCourses();
  }

  Future<void> loadCourses() async {
    try {
      final courses = await ApiService.fetchCourses();
      state = AsyncValue.data(courses);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}