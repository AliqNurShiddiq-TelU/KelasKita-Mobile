import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';

class PopularCoursesPage extends StatefulWidget {
  const PopularCoursesPage({super.key});

  @override
  State<PopularCoursesPage> createState() => _PopularCoursesPageState();
}

class _PopularCoursesPageState extends State<PopularCoursesPage> {
  // ============================
  // Dropdown Options
  // ============================
  String selectedFilter = "Popular";

  final List<String> filterOptions = [
    "Popular",
    "Newest",
    "Price: Low to High",
    "Price: High to Low"
  ];

  // Dummy Course Data
  final List<Map<String, dynamic>> courses = [
    {
      "title": "Advanced React Patterns",
      "mentor": "Kent C. Dodds",
      "rating": 4.9,
      "students": 15400,
      "price": "\$29.99",
      "image": "https://picsum.photos/410/200",
    },
    {
      "title": "The Complete 2024 Web Development Bootcamp",
      "mentor": "Dr. Angela Yu",
      "rating": 4.8,
      "students": 28200,
      "price": "\$12.99",
      "image": "https://picsum.photos/411/200",
    },
    {
      "title": "Illustrator 2024 Essentials",
      "mentor": "Martin Perhiniak",
      "rating": 4.8,
      "students": 9000,
      "price": "\$18.99",
      "image": "https://picsum.photos/412/200",
    },
    {
      "title": "iOS 17 & Swift 5 - The Complete Guide",
      "mentor": "Dr. Angela Yu",
      "rating": 4.7,
      "students": 11000,
      "price": "\$14.99",
      "image": "https://picsum.photos/413/200",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 0, // My Courses Tab
        onTap: (i) {},
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =====================================================
              // HEADER (Back Button + Title)
              // =====================================================
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, size: 26),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Popular Courses",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // =====================================================
              // COURSES COUNT
              // =====================================================
              Text(
                "${courses.length} Courses Found",
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 15),

              // =====================================================
              // FILTER DROPDOWN
              // =====================================================
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedFilter,
                    items: filterOptions.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedFilter = newValue!;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =====================================================
              // COURSE LIST
              // =====================================================
              ...courses.map((course) {
                return _courseListCard(
                  imageUrl: course["image"],
                  title: course["title"],
                  mentor: course["mentor"],
                  rating: course["rating"],
                  students: course["students"],
                  price: course["price"],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// REUSABLE COURSE CARD (Vertical List)
// =====================================================
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

        // TEXT INFORMATION
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 3),
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
                fontSize: 12),
          ),
        ),
      ],
    ),
  );
}
