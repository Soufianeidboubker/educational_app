import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenWidth * 0.02,
        horizontal: screenWidth * 0.02,
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Course Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              course.imageUrl,
              width: screenWidth * 0.25,
              height: screenWidth * 0.25,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          // Course Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  course.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  'Duration: ${course.duration}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}