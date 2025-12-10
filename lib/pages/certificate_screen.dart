import 'package:flutter/material.dart';

class CertificateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Sertifikat", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://source.unsplash.com/random/800x600/?certificate"),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Sertifikat Digital",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Selamat! Anda telah menyelesaikan kursus\nDasar Pemrograman Perangkat Bergerak.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Download sertifikat...")),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                backgroundColor: Colors.blue.shade700,
              ),
              child: const Text("Download Sertifikat", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}