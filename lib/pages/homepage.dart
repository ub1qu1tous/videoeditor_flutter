import 'package:flutter/material.dart';
import '../screens/video_tools.dart';
import '../screens/photo_tools.dart';
import '../screens/audio_tools.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                Row(children: [
                  Text(
                    'Your all-in-one media toolkit',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ]),
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
                          MaterialPageRoute(builder: (context) => VideoTools()),
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
                          MaterialPageRoute(builder: (context) => AudioTools()),
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
                          MaterialPageRoute(builder: (context) => PhotoTools()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('Explore tools',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton2(icon: Icons.add, label: 'Add', onTap: () {}),
                    CustomButton2(icon: Icons.add, label: 'Add', onTap: () {}),
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
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<CustomButton1> createState() => _CustomButton1State();
}

class _CustomButton1State extends State<CustomButton1> {
  late Color backgroundColor =
      Theme.of(context).colorScheme.surface == Colors.white
          ? Colors.grey.withOpacity(0.15)
          : Colors.grey.withOpacity(0.50);
  final Color hoverColor = Colors.blue;
  late Color textIconDefault =
      Theme.of(context).colorScheme.surface == Colors.white
          ? Colors.black
          : Colors.white;
  late Color textIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          backgroundColor = hoverColor;
          textIconDefault = textIconColor;
        });
      },
      onExit: (_) {
        setState(() {
          backgroundColor =
              Theme.of(context).colorScheme.surface == Colors.white
                  ? Colors.grey.withOpacity(0.15)
                  : Colors.grey.withOpacity(0.50);
          textIconDefault =
              Theme.of(context).colorScheme.surface == Colors.white
                  ? Colors.black
                  : Colors.white;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 165,
          height: 90,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 25, color: textIconDefault),
              SizedBox(height: 8),
              Text(widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textIconDefault, fontSize: 12)),
            ],
          )),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CustomButton2({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<CustomButton2> createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
  late Color backgroundColor =
      Theme.of(context).colorScheme.surface == Colors.white
          ? Colors.grey.withOpacity(0.15)
          : Colors.grey.withOpacity(0.50);
  final Color hoverColor = Colors.blue;
  late Color textIconDefault =
      Theme.of(context).colorScheme.surface == Colors.white
          ? Colors.black
          : Colors.white;
  late Color textIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          backgroundColor = hoverColor;
          textIconDefault = textIconColor;
        });
      },
      onExit: (_) {
        setState(() {
          backgroundColor =
              Theme.of(context).colorScheme.surface == Colors.white
                  ? Colors.grey.withOpacity(0.15)
                  : Colors.grey.withOpacity(0.50);
          textIconDefault =
              Theme.of(context).colorScheme.surface == Colors.white
                  ? Colors.black
                  : Colors.white;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: 275,
          height: 40,
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                color: Colors.grey,
              ),
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.width,
              child: Icon(widget.icon, size: 25, color: textIconDefault),
            ),
            SizedBox(width: 10),
            Text(widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(color: textIconDefault, fontSize: 12)),
          ]),
        ),
      ),
    );
  }
}
