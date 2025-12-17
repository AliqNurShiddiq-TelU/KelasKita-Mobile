import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';
import 'home_page.dart';
import 'my_courses_page.dart';
import 'schedule_page.dart';
import 'profile_page.dart';

class CategoriesPage extends StatelessWidget {
  // 1. Tambahkan variabel themeNotifier
  final ValueNotifier<ThemeMode> themeNotifier;

  // 2. Update Constructor agar bisa menerima data dari halaman sebelumnya
  const CategoriesPage({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gunakan warna background dari tema agar berubah saat dark mode
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // Navigasi Bawah
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 1, // Index Explore/Categories
        themeNotifier: themeNotifier, // Kirim notifier ke navbar
        onTap: (i) {
          if (i == 1) return; // Sudah di halaman ini

          Widget nextPage;
          if (i == 0) {
            nextPage = HomePage(themeNotifier: themeNotifier);
          } else if (i == 2) {
            nextPage = MyCoursesPage(themeNotifier: themeNotifier);
          } else if (i == 3) {
            nextPage = SchedulePage(themeNotifier: themeNotifier);
          } else if (i == 4) {
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

      // Isi Halaman (Konten Asli Anda)
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
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, size: 26),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Tambahkan logika filter di sini jika ada
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ===================== CATEGORY CHIPS =====================
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _categoryChip("All", isActive: true),
                    _categoryChip("Design"),
                    _categoryChip("Coding"),
                    _categoryChip("Marketing"),
                    _categoryChip("Business"),
                    _categoryChip("Lifestyle"),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // ===================== COURSE LIST =====================
              // COURSE 1
              GestureDetector(
                onTap: () {
                  // Tambahkan navigasi ke detail course di sini
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

              const SizedBox(height: 15),

              // COURSE 2
              GestureDetector(
                onTap: () {
                  // Tambahkan navigasi ke detail course di sini
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

              const SizedBox(height: 15),

              // COURSE 3
              GestureDetector(
                onTap: () {
                  // Tambahkan navigasi ke detail course di sini
                },
                child: _courseCard(
                  imageUrl: "https://picsum.photos/302/200",
                  title: "Digital Marketing Strategy",
                  mentor: "Dian Martin",
                  rating: 4.7,
                  students: 3200,
                  price: "\$14.99",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ====================== WIDGET BANTUAN ======================

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
      width: double.infinity, // Gunakan lebar penuh
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
                  height: 180, // Tinggi gambar disesuaikan untuk tampilan vertikal
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
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
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // CONTENT BELOW IMAGE
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black, // Paksa warna teks hitam di kartu putih
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      mentor,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 5),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black, // Paksa warna teks hitam
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "|  $students students",
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
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