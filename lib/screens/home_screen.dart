class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coursesAsync = ref.watch(courseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(courseProvider.notifier).loadCourses(),
          ),
        ],
      ),
      body: coursesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (courses) => CourseListView(courses: courses),
      ),
    );
  }
}

class CourseListView extends StatelessWidget {
  final List<Course> courses;
  
  const CourseListView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => /* Implement refresh logic */,
      child: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) => CourseCard(course: courses[index]),
      ),
    );
  }
}