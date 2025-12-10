import 'package:flutter/material.dart';

class CoursePlayerPage extends StatelessWidget {
  const CoursePlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),

            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "UI/UX Design Masterclass",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),
                              Icon(Icons.star, color: Colors.amber, size: 18),

                              SizedBox(width: 5),
                              Text(
                                "4.1 (2.5k reviews)",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Divider(height: 1),

                    
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const TabBar(
                            labelColor: Color(0xFF1565C0),
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Color(0xFF1565C0),
                            tabs: [
                              Tab(text: "Lessons"),
                              Tab(text: "About"),
                            ],
                          ),
                          SizedBox(
                            height: 400, 
                            child: TabBarView(
                              children: [
                                
                                ListView(
                                  padding: const EdgeInsets.all(20),
                                  children: [
                                    _buildModuleItem(
                                      "Module 1: Introduction",
                                      "15 mins",
                                      isCompleted: true,
                                    ),
                                    _buildModuleItem(
                                      "Module 2: Design Thinking",
                                      "45 mins",
                                      isCompleted: true,
                                    ),
                                    _buildModuleItem(
                                      "Module 3: Wireframing",
                                      "30 mins",
                                      isPlaying: true,
                                    ),
                                    _buildModuleItem(
                                      "Module 4: Prototyping",
                                      "60 mins",
                                    ),
                                    _buildModuleItem(
                                      "Module 5: Testing",
                                      "40 mins",
                                    ),
                                  ],
                                ),

                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "Kelas ini untuk mempelajari tentang dasar UI/UX Design hingga tahap prototyping.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleItem(
    String title,
    String duration, {
    bool isCompleted = false,
    bool isPlaying = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isPlaying ? const Color(0xFFE3F2FD) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPlaying ? const Color(0xFF1565C0) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCompleted
                  ? const Color(0xFF4CAF50)
                  : (isPlaying
                        ? const Color(0xFF1565C0)
                        : Colors.grey.shade200),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCompleted
                  ? Icons.check
                  : (isPlaying ? Icons.play_arrow : Icons.lock_outline),
              color: isCompleted || isPlaying ? Colors.white : Colors.grey,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isPlaying ? const Color(0xFF1565C0) : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
