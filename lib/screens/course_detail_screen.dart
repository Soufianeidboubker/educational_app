import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;
  
  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'course-${course.title}',
              child: Image.asset(course.imageUrl),
            ),
            const SizedBox(height: 20),
            Text(
              course.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Chip(
              label: Text(course.duration),
              backgroundColor: Colors.blue.shade100,
            ),
          ],
        ),
      ),
    );
  }
}