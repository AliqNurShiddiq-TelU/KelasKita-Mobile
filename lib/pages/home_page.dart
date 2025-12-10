import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';
import 'kategori_page.dart';
import 'my_courses_page.dart';
import 'schedule_page.dart';
import 'profile_page.dart';
import 'course_detail_page.dart';
import 'module_detail_page.dart';
import 'modules_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: custombottomnavbar(
        currentIndex: 0,
        onTap: (i) {
          if (i == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyCoursesPage()),
            );
          } else if (i == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SchedulePage()),
            );
          } else if (i == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===================== HEADER =====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.purple.shade100,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Hello!,", style: TextStyle(color: Colors.grey)),
                          Text(
                            "Aliq Nur Shiddiq!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ===================== SEARCH BAR =====================
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Search for courses...",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Icon(Icons.settings_outlined, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===================== BANNER =====================
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "PROMO",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "50% OFF Today",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Master new skills with our premium courses.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xFF1565C0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        ),
                        onPressed: () {},
                        child: const Text("Get Started"),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ===================== CATEGORIES =====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CategoriesPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _categoryChip("All", isActive: true),
                    _categoryChip("Design"),
                    _categoryChip("Coding"),
                    _categoryChip("Marketing"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ===================== POPULAR COURSES =====================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Popular Courses",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("See All", style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // COURSE 1
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CourseDetailPage(
                              title: "UI/UX Design Masterclass",
                              mentor: "Sarah Jenkins",
                              imageUrl: "https://picsum.photos/300/200",
                              rating: 4.9,
                              students: 5400,
                              price: 249900,
                              description:
                                  "Kursus ini membahas UI/UX dari dasar hingga mahir menggunakan studi kasus real.",
                            ),
                          ),
                        );
                      },
                      child: _courseCard(
                        imageUrl: "https://picsum.photos/300/200",
                        title: "UI/UX Design Masterclass",
                        mentor: "Sarah Jenkins",
                        rating: 4.9,
                        students: 5400,
                        price: "\$24.99",
                      ),
                    ),

                    // COURSE 2
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CourseDetailPage(
                              title: "Python for Data Science",
                              mentor: "Jose Portilla",
                              imageUrl: "https://picsum.photos/301/200",
                              rating: 4.8,
                              students: 18200,
                              price: 189900,
                              description:
                                  "Belajar Python, NumPy, Pandas, dan Machine Learning dari awal.",
                            ),
                          ),
                        );
                      },
                      child: _courseCard(
                        imageUrl: "https://picsum.photos/301/200",
                        title: "Python for Data Science",
                        mentor: "Jose Portilla",
                        rating: 4.8,
                        students: 18200,
                        price: "\$18.99",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget custombottomnavbar({
    required int currentIndex,
    required Function(int) onTap,
  }) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF1565C0),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle),
          label: "My Courses",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Schedule",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }

  // ====================== WIDGETS LAINNYA ======================

  Widget _categoryChip(String text, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1565C0) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF1565C0)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF1565C0),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _courseCard({
    required String imageUrl,
    required String title,
    required String mentor,
    required double rating,
    required int students,
    required String price,
  }) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE + PRICE BADGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // CONTENT BELOW IMAGE
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      mentor,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "|  $students students",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
