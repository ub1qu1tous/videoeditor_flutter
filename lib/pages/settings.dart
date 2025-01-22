import 'package:flutter/material.dart';
import '../main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool onChanged = false;
  bool analyticsConsent = true;
  bool errorReporting = true;
  var outputPath = '';
  bool isOutputPathSaved = false;
  String selectedValue = 'Timestamp';
  var selectionArray = ['Timestamp', 'Incremental Counter'];

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
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
                    activeColor: Colors.grey,
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
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 70, child: Icon(Icons.folder_outlined))
              ]),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the left
                children: [
                  Text(
                    'Default Output Directory',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Set the output directory for all files.',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  if (isOutputPathSaved)
                    Row(
                      children: [
                        Text('Output Directory: $outputPath'),
                        IconButton(
                            onPressed: () {
                              // TODO OPEN FILE EXPLORER
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                ],
              )),
              Row(children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.black,
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.grey.shade300,
                    ),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                  ),
                  onPressed: () {
                    // TODO HELP USER SET OUTPUT PATH
                  },
                  child:
                      isOutputPathSaved ? Text('Change') : Text('Not chosen'),
                ),
              ]),
            ]),
            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 0.4),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 70, child: Icon(Icons.description))
              ]),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the left
                children: [
                  Text(
                    'Output Filename Suffix',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Set the output filename suffix.\n\n'
                    'Example: output_1.mp4 (incremental_counter)\n'
                    'Example: output_2024101312.mp4 (timestamp)',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                ],
              )),
              Row(children: [
                DropdownButton<String>(
                  icon: SizedBox.shrink(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: selectionArray
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
                    );
                  }).toList(),
                ),
              ]),
            ]),
            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 0.4),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 70, child: Icon(Icons.history))
              ]),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the left
                    children: [
                      Text(
                        'Clear Output History',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Clear all output history.\n\n'
                            'NOTE: This action can\'t be undone.',
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
                      setState(() {
                        // TODO clear output history (will probably involve rm -rf command or removing caches)
                      });
                    },
                    child: Text('Clear'))
              ]),
            ]),
            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 0.4),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 70, child: Icon(Icons.delete))
              ]),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the left
                    children: [
                      Text(
                        'Clear Cache',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Clear cached thumbnails, audio files, and logs.',
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
                      setState(() {
                        // TODO clear output history (will probably involve rm -rf command or removing caches)
                      });
                    },
                    child: Text('Clear'))
              ]),
            ]),
            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 0.4),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 70, child: Icon(Icons.refresh))
              ]),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the left
                    children: [
                      Text(
                        'Reconfigure Pimosa',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Locate or install FFmpeg and ImageMagick libraries on your device.',
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
                      setState(() {
                        // TODO clear output history (will probably involve rm -rf command or removing caches)
                      });
                    },
                    child: Text('Reconfigure'))
              ]),
            ]),
            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 0.4),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 70, child: Icon(Icons.stacked_line_chart))
              ]),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the left
                    children: [
                      Text(
                        'Anonymous Analytics',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Help improve the app by sending anonymous usage data.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                    ],
                  )),
              Row(children: [
                Switch.adaptive(
                    value: analyticsConsent,
                    onChanged: (value) {
                      setState(() {
                        analyticsConsent = value;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.white)
              ]),
            ]),
            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 0.4),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                SizedBox(width: 70, child: Icon(Icons.stacked_line_chart))
              ]),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns items to the left
                    children: [
                      Text(
                        'Error Reporting',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Help improve stability by sending error reports to developers.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      ),
                    ],
                  )),
              Row(children: [
                Switch.adaptive(
                    value: errorReporting,
                    onChanged: (value) {
                      setState(() {
                        errorReporting = value;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.white)
              ]),
            ]),
            SizedBox(height: 20),
            Divider(color: Colors.grey, thickness: 0.4),
          ],
        ),
      )
    ]);
  }
}