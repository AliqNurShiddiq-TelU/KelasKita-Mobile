import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';
import 'home_page.dart';
import 'schedule_page.dart';
import 'profile_page.dart';
import 'course_player_page.dart';

class MyCoursesPage extends StatelessWidget {
  // 1. Tambahkan variabel themeNotifier
  final ValueNotifier<ThemeMode> themeNotifier;

  // 2. Update Constructor
  const MyCoursesPage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gunakan warna background dari tema agar berubah saat dark mode
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // Navigasi Bawah
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 2, // Index My Courses
        themeNotifier: themeNotifier, // Kirim notifier ke navbar
        onTap: (index) {
          if (index == 2) return; // Sudah di halaman ini

          Widget nextPage;
          if (index == 0) {
            nextPage = HomePage(themeNotifier: themeNotifier);
          } else if (index == 3) {
            nextPage = SchedulePage(themeNotifier: themeNotifier);
          } else if (index == 4) {
            nextPage = ProfilePage(themeNotifier: themeNotifier);
          } else {
            // Default fallback
            nextPage = HomePage(themeNotifier: themeNotifier);
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
      ),

      // ISI KONTEN ASLI ANDA
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Learning",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Banner "Continue Watching"
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1565C0),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1565C0).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Continue Watching",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "UI/UX Design Masterclass",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Lesson 5 of 12: Wireframing",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    LinearProgressIndicator(
                      value: 0.45,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1565C0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoursePlayerPage(),
                            ),
                          );
                        },
                        child: const Text("Continue Learning"),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Enrolled Courses",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Daftar Kursus
              _buildCourseItem(
                title: "Python for Data Science",
                author: "Jose Portilla",
                progress: 0.75,
                imageUrl: "https://picsum.photos/100/100",
              ),
              _buildCourseItem(
                title: "Digital Marketing 101",
                author: "Robin & Jesper",
                progress: 0.10,
                imageUrl: "https://picsum.photos/101/100",
              ),
              _buildCourseItem(
                title: "Flutter Mobile Dev",
                author: "Angela Yu",
                progress: 0.30,
                imageUrl: "https://picsum.photos/102/100",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Bantuan (Sama Persis)
  Widget _buildCourseItem({
    required String title,
    required String author,
    required double progress,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black, // Paksa hitam agar terbaca di card putih
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  author,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF1565C0),
                        ),
                        minHeight: 5,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
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