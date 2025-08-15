import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Generated file
import 'utils/routes.dart';
import 'screens/home_screen.dart';
import 'providers/auth_provider.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app with ProviderScope for state management
  runApp(
    ProviderScope(
      child: EducationalApp(),
    ),
  );
}

class EducationalApp extends ConsumerWidget {
  const EducationalApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'Educational App',
      debugShowCheckedModeBanner: false,
      
      // ===== THEME CONFIGURATION =====
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      // ===== ROUTING CONFIGURATION =====
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.home,

      // ===== AUTH STATE MANAGEMENT =====
      home: authState.when(
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (error, stack) => Scaffold(
          body: Center(child: Text('Error: $error')),
        ),
        data: (user) {
          return user != null 
              ? const HomeScreen() 
              : const LoginScreen();
        },
      ),
    );
  }
}