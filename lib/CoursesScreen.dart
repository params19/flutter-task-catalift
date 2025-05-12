import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Your UI (header, search, course list, chips, etc.)
            // You can paste your earlier detailed UI code here
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Courses Page', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
