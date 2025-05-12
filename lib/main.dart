import 'package:catalift/ExploreMentorsScreen.dart';
import 'package:catalift/OtherCoursesScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CataliftApp());
}

class CataliftApp extends StatelessWidget {
  const CataliftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const CoursesScreen(),
    const ExploreMentorsScreen(),
    const OtherCoursesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF000053),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore Mentors"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Courses"),
        ],
      ),
    );
  }
}

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  final List<Map<String, String>> courses = const [
    {
      'title': 'Artificial Intelligence and ML',
      'lessons': '15 Lessons',
      'price': '₹1,500',
      'image': 'assets/ai_ml.png'
    },
    {
      'title': 'User Interface and User Experience',
      'lessons': '15 Lessons',
      'price': '₹1,500',
      'image': 'assets/ce.png'
    },
    {
      'title': 'Computer Engineering',
      'lessons': '15 Lessons',
      'price': '₹1,500',
      'image': 'assets/ui_ux.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF000053),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('CATALIFT',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2)),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      SizedBox(width: 12),
                      Icon(Icons.notifications, color: Colors.white),
                      SizedBox(width: 12),
                      Icon(Icons.chat, color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8),
                  Text('Courses',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.filter_alt_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _sectionTitle('Featured For You'),
            _courseList(),
            const SizedBox(height: 2),
            _sectionTitle('Most Popular'),
            _categoryChips(),
            _courseList(),
            _sectionTitle('Our Courses'),
            _courseList(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const Spacer(),
          Text('See All', style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _courseList() {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final course = courses[index];
          return SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        course['image']!,
                        height: 80,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: Icon(Icons.bookmark_border, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(course['lessons']!,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                // Add a Key to the course title to make it unique
                Text(
                  course['title']!,
                  key: Key(course['title']!), // Key is added here
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(course['price']!,
                    style: const TextStyle(color: Colors.green)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _categoryChips() {
    final categories = [
      "All",
      "AI & ML",
      "Product",
      "Sales",
      "Public Speaking",
      "Engineering"
    ];

    const selectedCategory = "All";
    const borderColor = Color(0xFF000053);

    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return ChoiceChip(
            labelPadding: EdgeInsets.symmetric(
              horizontal: category == "All" ? 14 : 12,
            ),
            label: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : borderColor,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
            selected: isSelected,
            onSelected: (_) {},
            selectedColor: borderColor,
            backgroundColor: Colors.white,
            shape: const StadiumBorder(
              side: BorderSide(
                color: borderColor,
                width: 1,
              ),
            ),
            visualDensity: VisualDensity.compact,
          );
        },
      ),
    );
  }
}
