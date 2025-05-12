import 'package:flutter/material.dart';

class ExploreMentorsScreen extends StatelessWidget {
  const ExploreMentorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          "Explore Mentors Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
