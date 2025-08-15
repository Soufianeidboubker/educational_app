import 'package:flutter/material.dart';
import '../widgets/course_card.dart';
import '../models/course.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Course> courses = const [
    Course(
      title: 'Introduction to Flutter',
      description: 'Learn the basics of Flutter development',
      imageUrl: '/assets/images/digital-marketing-analytics (1).png',
      duration: '4 weeks',
    ),
    Course(
      title: 'Advanced Dart Programming',
      description: 'Deep dive into Dart language features',
      imageUrl: '/assets/images/mobile-app-development.png',
      duration: '6 weeks',
    ),
    Course(
      title: 'UI/UX Design Principles',
      description: 'Master designing intuitive interfaces',
      imageUrl: '/assets/images/ui-ux-design-mockups.png',
      duration: '5 weeks',
    ),
  ];

  Future<void> _refreshCourses() async {
    // Simulate network fetch
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade700,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshCourses,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenSize.height,
              maxWidth: 600,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Explore your courses and continue learning',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: courses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) => CourseCard(
                      course: courses[index],
                      onTap: () {
                        // Handle course selection
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}