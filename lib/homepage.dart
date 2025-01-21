import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
        child: ListView(
      children: [
        Column(
          children: [
            SizedBox(height: 30),
            Row(children: [
              Text(
              'Your all-in-one media toolkit',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )]),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton1(
                  icon: Icons.videocam_outlined,
                  label: 'Video tools',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VideoToolsScreen()),
                    );
                  },
                ),
                SizedBox(width: 20),
                CustomButton1(
                  icon: Icons.music_note_outlined,
                  label: 'Audio tools',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AudioToolsScreen()),
                    );
                  },
                ),
                SizedBox(width: 20),
                CustomButton1(
                  icon: Icons.photo_outlined,
                  label: 'Image tools',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PhotoToolsScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}

class CustomButton1 extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CustomButton1({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  _CustomButton1State createState() => _CustomButton1State();
}

class _CustomButton1State extends State<CustomButton1> {
  late Color _backgroundColor = Theme.of(context).colorScheme.surface == Colors.white ? Colors.grey.withOpacity(0.15): Colors.grey.withOpacity(0.50);
  final Color _hoverColor = Colors.blue;
  Color text_and_icon_hover_color = Colors.white;
  late Color default_text_icon_color = Theme.of(context).colorScheme.surface == Colors.white ? Colors.black: Colors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _backgroundColor = _hoverColor;
          default_text_icon_color = text_and_icon_hover_color;
        });
      },
      onExit: (_) {
        setState(() {
          _backgroundColor = Theme.of(context).colorScheme.surface == Colors.white ? Colors.grey.withOpacity(0.15): Colors.grey.withOpacity(0.50);
          default_text_icon_color = Theme.of(context).colorScheme.surface == Colors.white ? Colors.black: Colors.white;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 200,
          height: 110,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 30, color: default_text_icon_color),
              SizedBox(height: 8),
              Text(widget.label, textAlign: TextAlign.center, style: TextStyle(color: default_text_icon_color)),
            ],
          )),
        ),
      ),
    );
  }
}

// Dummy Screens for Navigation
class VideoToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Tools')),
      body: Center(child: Text('Welcome to Video Tools')),
    );
  }
}

class PhotoToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Tools')),
      body: Center(child: Text('Welcome to Photo Tools')),
    );
  }
}

class AudioToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Tools')),
      body: Center(child: Text('Welcome to Audio Tools')),
    );
  }
}
