import 'package:flutter/material.dart';

class ModuleDetailPage extends StatelessWidget {
  final String title;

  const ModuleDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail Video
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://picsum.photos/600/300",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Judul
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Deskripsi Modul
            const Text(
              "Dalam modul ini kamu akan mempelajari materi secara lengkap, mulai dari teori, implementasi, sampai contoh kode nyata. "
              "Materi ini masih dummy dan dapat kamu ganti kapan saja.",
              style: TextStyle(fontSize: 15, height: 1.4),
            ),

            const SizedBox(height: 25),

            // Progress
            const Text(
              "Progress Belajar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.35,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 5),
            const Text("35% selesai", style: TextStyle(fontSize: 14)),

            const SizedBox(height: 30),

            // Materi PDF
            const Text(
              "Materi PDF / Ringkasan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                title: const Text("Download Modul PDF"),
                subtitle: const Text("Ringkasan materi dalam format PDF"),
                trailing: const Icon(Icons.download),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 30),

            // Daftar Video
            const Text(
              "Daftar Materi Video",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ...List.generate(
              6,
              (i) => Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(Icons.play_circle_fill, size: 35),
                  title: Text("Video ${i + 1}"),
                  subtitle: const Text("Durasi 5 menit"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {},
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {},
          child: const Text(
            "Mulai Belajar",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
