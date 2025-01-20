import 'package:flutter/material.dart';
import 'services.dart';
import 'main.dart';

class ServiceGridPage extends StatelessWidget {
  const ServiceGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SizedBox(height: 20.0),
          _buildServiceSection('Video Tools', videoService),
          SizedBox(height: 20.0), // Space between sections
          _buildServiceSection('Audio Tools', audioService),
          SizedBox(height: 20.0), // Space between sections
          _buildServiceSection('Image Tools', imageService),
          SizedBox(height: 100.0), // Space between sections
        ],
      ),
    );
  }

  Widget _buildServiceSection(String title, Service service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0), // Space between title and grid
        GridView.builder(
          shrinkWrap: true, // Allows GridView to size itself inside ListView
          physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing: 10, // Horizontal space between grid items
            mainAxisSpacing: 10, // Vertical space between grid items
            childAspectRatio: 0.8, // Aspect ratio of each grid item
          ),
          itemCount: service.features.length,
          itemBuilder: (context, index) {
            final feature = service.features[index];
            bool isHovered = false; // Local hover state

            return StatefulBuilder(
              builder: (context, setState) {
                return MouseRegion(
                  onEnter: (_) => setState(() => isHovered = true),
                  onExit: (_) => setState(() => isHovered = false),
                  child: GestureDetector(
                    onTap: () {
                        // Navigate to the respective tool's page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppScreen(),
                            // builder: (context) => VideoEditorScreen(),
                          ),
                        );
                      },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        color: isHovered
                            ? Colors.blue
                            : Colors.transparent, // Change color on hover
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey.withOpacity(0.25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            feature.icon,
                            size: 35.0,
                            color: isHovered
                                ? Colors.white
                                : Colors.black.withOpacity(0.25), // Change icon color
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            feature.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: isHovered ? Colors.white : Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            feature.description,
                            style: TextStyle(color: isHovered ? Colors.white : Colors.grey,),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                      ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
