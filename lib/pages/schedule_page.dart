import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';
import 'home_page.dart';
import 'my_courses_page.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 3, // Schedule tab
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyCoursesPage()),
            );
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              const Text(
                "Live Schedule",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // UPCOMING SESSION
              _buildSectionTitle("Upcoming Today"),
              _buildScheduleCard(
                context,
                date: "08",
                month: "DEC",
                time: "14:00 - 15:30",
                title: "Advanced Flutter Layouts",
                mentor: "Eko Kurniawan",
                isToday: true,
              ),

              const SizedBox(height: 20),
              _buildSectionTitle("Next Week"),
              _buildScheduleCard(
                context,
                date: "12",
                month: "DEC",
                time: "10:00 - 11:30",
                title: "State Management 101",
                mentor: "Sarah Jenkins",
              ),
              _buildScheduleCard(
                context,
                date: "14",
                month: "DEC",
                time: "13:00 - 14:30",
                title: "API Integration",
                mentor: "Jose Portilla",
              ),
              _buildScheduleCard(
                context,
                date: "15",
                month: "DEC",
                time: "09:00 - 10:30",
                title: "Firebase Auth",
                mentor: "Angela Yu",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildScheduleCard(
    BuildContext context, {
    required String date,
    required String month,
    required String time,
    required String title,
    required String mentor,
    bool isToday = false,
  }) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mentor: $mentor"),
                const SizedBox(height: 8),
                Text("Time: $time"),
                const SizedBox(height: 16),
                const Text(
                  "This is a dummy detail for the live class session. In a real app, this would show the meeting link and materials.",
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Close"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Join Now"),
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isToday ? const Color(0xFFE3F2FD) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isToday ? const Color(0xFF1565C0) : Colors.grey.shade200,
            width: isToday ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // DATE BOX
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isToday
                    ? const Color(0xFF1565C0)
                    : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isToday ? Colors.white : Colors.black87,
                    ),
                  ),
                  Text(
                    month,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isToday ? Colors.white70 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),

            // INFO
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: isToday ? const Color(0xFF1565C0) : Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "by $mentor",
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // ARROW
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: isToday ? const Color(0xFF1565C0) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
