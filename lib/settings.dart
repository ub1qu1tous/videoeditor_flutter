import 'package:flutter/material.dart';
import 'main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          SizedBox(height: 40),
          Row(children: [
            Text(
              'Settings',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              SizedBox(width: 70, child: Icon(Icons.palette_outlined))
            ]),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns items to the left
              children: [
                Text(
                  'App theme',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Change the app theme between light and dark.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              ],
            )),
            Row(children: [
              Switch.adaptive(
                  value: onChanged,
                  onChanged: (value) {
                    setState(() {
                      onChanged = value;
                      if (value) {
                        MyApp.of(context).changeTheme(ThemeMode.dark);
                      } else {
                        MyApp.of(context).changeTheme(ThemeMode.light);
                      }
                    });
                  },
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.black)
            ]),
          ]),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [SizedBox(width: 70, child: Icon(Icons.download))]),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns items to the left
              children: [
                Text(
                  'Check for updates',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Click to check for updates.\n\nNOTE: Updates will only work if your app is installed in the /Applications directory.',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                ),
              ],
            )),
            Row(children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(
                    Colors.white,
                  ),
          backgroundColor: WidgetStateProperty.all<Color>(
            Colors.blue,
          ),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {
                  // TODO check update
                },
                child: Text('Check'),
              ),
            ]),
          ]),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(children: []),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(children: []),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(children: []),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(children: []),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(children: []),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(children: []),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(children: []),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.4)
        ],
      ),
    ));
  }
}
