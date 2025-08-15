import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await ref.read(authProvider.notifier).login("test@email.com", "password");
          },
          child: Text("Sign In"),
        ),
      ),
    );
  }
}