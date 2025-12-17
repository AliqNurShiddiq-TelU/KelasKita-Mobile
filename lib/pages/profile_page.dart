import 'package:flutter/material.dart';
import 'package:kelaskita_mobile/widgets/custom_buttom_navbar.dart';
import 'home_page.dart';
import 'my_courses_page.dart';
import 'schedule_page.dart';
import 'settings_screen.dart'; // Import Settings

class ProfilePage extends StatefulWidget {
  // 1. Menerima themeNotifier
  final ValueNotifier<ThemeMode> themeNotifier;

  // 2. Constructor
  const ProfilePage({super.key, required this.themeNotifier});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // --- STATE UNTUK KONTEN PROFIL (NADIA) ---
  bool isEditing = false;
  String name = "Nadia";
  String email = "nadia@gmail.com";
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // Logika Ganti Foto
  int currentAvatarIndex = 0;
  final List<String> avatarOptions = [
    "https://api.dicebear.com/9.x/avataaars/png?seed=NadiaHijab&top=hijab&clothing=graphicShirt&clothingColor=pink&mouth=smile&skinColor=light",
    "https://api.dicebear.com/9.x/lorelei/png?seed=HappyNadia&mouth=happy&eyes=happy&backgroundColor=b6e3f4",
    "https://avatar.iran.liara.run/public/girl?username=Nadia",
    "https://avatar.iran.liara.run/public/boy?username=Ali",
  ];

  String get currentAvatarUrl => avatarOptions[currentAvatarIndex];

  void _changePhoto() {
    setState(() {
      currentAvatarIndex = (currentAvatarIndex + 1) % avatarOptions.length;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Foto diganti!"),
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    emailController.text = email;
  }
  // -----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background mengikuti tema
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          // Tombol Settings
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    themeNotifier: widget.themeNotifier,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // Navigasi Bawah (Sesuai request Anda)
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 4, // Index Profile
        themeNotifier: widget.themeNotifier,
        onTap: (index) {
          if (index == 4) return;

          Widget nextPage;
          if (index == 0) {
            nextPage = HomePage(themeNotifier: widget.themeNotifier);
          } else if (index == 2) {
            nextPage = MyCoursesPage(themeNotifier: widget.themeNotifier);
          } else if (index == 3) {
            nextPage = SchedulePage(themeNotifier: widget.themeNotifier);
          } else {
             nextPage = HomePage(themeNotifier: widget.themeNotifier);
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        },
      ),

      // Isi Halaman (Konten Profil Lengkap)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Foto Profil dengan Tombol Ganti
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 130, height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue.shade100, width: 4),
                      color: Colors.grey[200],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        currentAvatarUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                        },
                        errorBuilder: (context, error, stackTrace) => 
                           Icon(Icons.person, size: 60, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 4, bottom: 4,
                    child: Material(
                      color: Colors.blue,
                      shape: const CircleBorder(),
                      elevation: 3,
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: isEditing ? _changePhoto : null,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: isEditing ? Colors.white : Colors.white.withOpacity(0.5),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            if (isEditing)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Klik ikon kamera untuk ganti gaya foto",
                  style: TextStyle(color: Colors.blue[700], fontSize: 13)),
              ),

            const SizedBox(height: 35),

            // Input Nama
            isEditing
                ? TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  )
                : Column(
                    children: [
                      Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                    ],
                  ),

            const SizedBox(height: 15),

            // Input Email
            isEditing
                ? TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  )
                : Text(email, style: TextStyle(fontSize: 16, color: Colors.grey[600])),

            const SizedBox(height: 50),

            // Tombol Save / Edit
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (isEditing) {
                    setState(() {
                      name = nameController.text;
                      email = emailController.text;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profil berhasil disimpan!")),
                    );
                  }
                  setState(() => isEditing = !isEditing);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  isEditing ? "Save Changes" : "Edit Profile",
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}