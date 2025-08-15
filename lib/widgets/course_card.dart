import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback? onTap;

  const CourseCard({
    super.key,
    required this.course,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: course.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.title, style: Theme.of(context).textTheme.titleMedium),
                    Text(course.duration),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}