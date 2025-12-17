import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  
  // Wajib ada untuk meneruskan fitur Dark Mode antar halaman
  final ValueNotifier<ThemeMode> themeNotifier; 

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.themeNotifier, // Wajib diisi di constructor
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      
      // Styling
      selectedItemColor: const Color(0xFF1565C0), // Warna biru saat aktif
      unselectedItemColor: Colors.grey[600],      // Warna abu saat tidak aktif
      
      // Menggunakan Theme.of(context) agar warna background berubah saat Dark Mode
      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor ?? Colors.white,
      
      type: BottomNavigationBarType.fixed, // Fixed agar label tetap muncul semua
      elevation: 8,
      showUnselectedLabels: true,

      items: const [
        // Index 0: Home
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        
        // Index 1: Explore / Categories
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: 'Explore',
        ),
        
        // Index 2: My Courses
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined),
          activeIcon: Icon(Icons.book),
          label: 'My Courses',
        ),
        
        // Index 3: Schedule
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule_outlined),
          activeIcon: Icon(Icons.schedule),
          label: 'Schedule',
        ),
        
        // Index 4: Profile
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}