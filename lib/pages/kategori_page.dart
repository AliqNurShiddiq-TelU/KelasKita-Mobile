import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 1, // Explore tab
        onTap: (i) {},
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ====================================================
              // HEADER: Back Button + Title + Filter Icon
              // ====================================================
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
                    onPressed: () {},
                  )
                ],
              ),

              const SizedBox(height: 20),

              // ====================================================
              // CATEGORY CHIPS
              // ====================================================
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _categoryChip("All", isActive: true),
                    _categoryChip("Design"),
                    _categoryChip("Development"),
                    _categoryChip("Business"),
                    _categoryChip("Lifestyle"),
                    _categoryChip("Photography"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ====================================================
              // COURSE LIST (VERTICAL)
              // ====================================================
              _courseListCard(
                imageUrl: "https://picsum.photos/400/200",
                title: "UI/UX Design Masterclass",
                mentor: "Sarah Jenkins",
                rating: 4.9,
                students: 5400,
                price: "\$24.99",
              ),

              _courseListCard(
                imageUrl: "https://picsum.photos/401/200",
                title: "Python for Data Science",
                mentor: "Jose Portilla",
                rating: 4.8,
                students: 18200,
                price: "\$18.99",
              ),

              _courseListCard(
                imageUrl: "https://picsum.photos/402/200",
                title: "Digital Marketing Essentials",
                mentor: "Robin & Jesper",
                rating: 4.5,
                students: 9000,
                price: "\$12.99",
              ),

              _courseListCard(
                imageUrl: "https://picsum.photos/403/200",
                title: "Mobile App Design in Figma",
                mentor: "DesignCourse",
                rating: 4.7,
                students: 13300,
                price: "\$16.99",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

Widget _courseListCard({
  required String imageUrl,
  required String title,
  required String mentor,
  required double rating,
  required int students,
  required String price,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        // IMAGE
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imageUrl,
            width: 110,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 12),

        // TEXT INFO
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 5),

              // MENTOR
              Row(
                children: [
                  const Icon(Icons.person_outline,
                      size: 14, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    mentor,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              // RATING + STUDENTS
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 3),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "|  $students students",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),

        // PRICE BADGE
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
      ],
    ),
  );
}
