import 'package:flutter/material.dart';
import 'module_detail_page.dart';

class ModulesPage extends StatelessWidget {
  const ModulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      {"title": "Pengenalan Flutter", "videos": "4 video • 12 menit"},
      {"title": "Instalasi & Setup Tools", "videos": "3 video • 18 menit"},
      {"title": "Widget Dasar", "videos": "5 video • 24 menit"},
      {"title": "State Management Dasar", "videos": "4 video • 20 menit"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Modul")),
      body: ListView.builder(
        itemCount: modules.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(Icons.play_circle_fill, size: 40),
              title: Text(
                modules[index]["title"]!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(modules[index]["videos"]!),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ModuleDetailPage(
                      title: modules[index]["title"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
