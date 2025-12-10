import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const SettingsScreen({required this.themeNotifier});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notification = true;
  String language = "Indonesia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // Notifikasi
          Card(
            child: SwitchListTile(
              title: const Text("Notifikasi"),
              subtitle: const Text("Aktifkan/Nonaktifkan"),
              value: notification,
              onChanged: (val) => setState(() => notification = val),
            ),
          ),

          // Dark Mode
          Card(
            child: ValueListenableBuilder<ThemeMode>(
              valueListenable: widget.themeNotifier,
              builder: (context, mode, child) {
                return SwitchListTile(
                  title: const Text("Dark Mode"),
                  subtitle: Text(mode == ThemeMode.dark ? "Aktif" : "Nonaktif"),
                  value: mode == ThemeMode.dark,
                  onChanged: (val) {
                    widget.themeNotifier.value =
                        val ? ThemeMode.dark : ThemeMode.light;
                  },
                );
              },
            ),
          ),

          // Bahasa
          Card(
            child: ListTile(
              title: const Text("Bahasa Aplikasi"),
              subtitle: Text(language),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _showLanguageDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Pilih Bahasa"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("Indonesia"),
              onTap: () {
                setState(() => language = "Indonesia");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("English"),
              onTap: () {
                setState(() => language = "English");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}