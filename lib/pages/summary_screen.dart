import 'package:flutter/material.dart';
import 'certificate_screen.dart'; 

class SummaryScreen extends StatelessWidget {
  final List<Map<String, String>> finishedCourses = [
    {"name": "UI/UX Mobile Design", "date": "1 Des 2025"},
    {"name": "Flutter Advanced Course", "date": "1 Des 2025"},
    {"name": "Flutter Advanced Course", "date": "5 Des 2025"},
    {"name": "Responsive Web Dev", "date": "5 Des 2025"},
  ];

  @override
  Widget build(BuildContext context) {
    
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final cardColor = Theme.of(context).cardColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Summary", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          
          
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.blue.shade600],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sertifikat Telah Diperoleh!",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Dasar Pemrograman Perangkat Bergerak",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CertificateScreen()),
                    );
                  },
                  child: const Text("Lihat Detail"),
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

          Text(
            "Kelas yang Sudah Selesai",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
          ),

          const SizedBox(height: 10),

          // List Kelas
          ...finishedCourses.map((course) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2))
                ],
              ),
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green, size: 28),
                title: Text(
                  course["name"]!,
                  style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
                ),
                subtitle: Text(
                  "Selesai: ${course["date"]}",
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Info: ${course['name']}")),
                  );
                },
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}