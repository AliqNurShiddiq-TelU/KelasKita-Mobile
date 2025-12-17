import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';
import 'kategori_page.dart';
import 'my_courses_page.dart';
import 'schedule_page.dart';
import 'profile_page.dart';
import 'course_detail_page.dart';
import 'settings_screen.dart'; // Import Settings

class HomePage extends StatelessWidget {
  // Variabel untuk mengontrol tema
  final ValueNotifier<ThemeMode> themeNotifier;

  // Constructor wajib menerima themeNotifier
  const HomePage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gunakan warna background dari tema agar berubah saat dark mode
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // Navigasi Bawah
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 0,
        themeNotifier: themeNotifier, // Penting: Kirim notifier ke navbar
        onTap: (i) {
          if (i == 0) return; // Sedang di Home

          Widget nextPage;
          // Tentukan halaman tujuan dan kirim themeNotifier
          if (i == 2) {
            nextPage = MyCoursesPage(themeNotifier: themeNotifier);
          } else if (i == 3) {
            nextPage = SchedulePage(themeNotifier: themeNotifier);
          } else if (i == 4) {
            nextPage = ProfilePage(themeNotifier: themeNotifier);
          } else {
            // Ke Categories/Explore
            nextPage = CategoriesPage(themeNotifier: themeNotifier);
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
      ),

      // Isi Halaman
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===================== HEADER (Profil & Notif) =====================
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

              // ===================== SEARCH BAR & SETTINGS =====================
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F9), // Warna search bar
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "Search for courses...",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    
                    // --- PERBAIKAN TOMBOL SETTINGS ---
                    // Menggunakan IconButton agar bisa diklik
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.settings_outlined, color: Colors.grey),
                      onPressed: () {
                         // Navigasi ke SettingsScreen membawa themeNotifier
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(themeNotifier: themeNotifier),
                          ),
                        );
                      },
                    ),
                    // --------------------------------
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ===================== BANNER BIRU =====================
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
                          foregroundColor: const Color(0xFF1565C0),
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
                      // Navigasi ke CategoriesPage membawa themeNotifier
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoriesPage(themeNotifier: themeNotifier),
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

  // ====================== WIDGET BANTUAN (Kodingan Asli Anda) ======================

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
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
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
                    color: Colors.black, 
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
                        color: Colors.black, 
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