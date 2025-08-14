import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import '../models/course.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Course> courses = const [
    Course(
      title: 'Introduction to Flutter',
      description: 'Learn the basics of Flutter development',
      imageUrl: 'https://via.placeholder.com/150',
      duration: '4 weeks',
    ),
    Course(
      title: 'Advanced Dart Programming',
      description: 'Deep dive into Dart language features',
      imageUrl: 'https://via.placeholder.com/150',
      duration: '6 weeks',
    ),
    Course(
      title: 'UI/UX Design Principles',
      description: 'Master designing intuitive interfaces',
      imageUrl: 'https://via.placeholder.com/150',
      duration: '5 weeks',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Explore your courses and continue learning',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          // Course Cards
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return CourseCard(course: courses[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}