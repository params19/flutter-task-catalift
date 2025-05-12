import 'package:flutter/material.dart';

class OtherCoursesScreen extends StatelessWidget {
  const OtherCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          "Courses Page (from NavBar)",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
