import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoursePage(),
    );
  }
}

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('CATALIFT'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Featured For You Section
          SectionTitle(title: "Featured For You"),
          CourseCard(
            title: "Artificial Intelligence and ML",
            price: "₹1,500",
            lessons: 15,
            image: "assets/ai_image.jpg", // Placeholder for AI image
          ),
          CourseCard(
            title: "User Interface and User Experience",
            price: "₹1,500",
            lessons: 15,
            image: "assets/ux_image.jpg", // Placeholder for UI/UX image
          ),
          CourseCard(
            title: "Computer Engineering",
            price: "₹1,500",
            lessons: 15,
            image: "assets/computer_image.jpg", // Placeholder for Computer Engineering image
          ),
          
          // Most Popular Section
          SectionTitle(title: "Most Popular"),
          CourseCard(
            title: "Artificial Intelligence and ML",
            price: "₹1,500",
            lessons: 15,
            image: "assets/ai_image.jpg",
          ),
          CourseCard(
            title: "User Interface and User Experience",
            price: "₹1,500",
            lessons: 15,
            image: "assets/ux_image.jpg",
          ),
          CourseCard(
            title: "Computer Engineering",
            price: "₹1,500",
            lessons: 15,
            image: "assets/computer_image.jpg",
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Explore Mentors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String price;
  final int lessons;
  final String image;

  CourseCard({
    required this.title,
    required this.price,
    required this.lessons,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          // Image Placeholder
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          SizedBox(width: 12),
          // Course Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "$lessons Lessons",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(color: Colors.blueAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
