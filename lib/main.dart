import 'package:flutter/material.dart';
import 'screens/main_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppState();

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pimosa',
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionColor: Colors.blue,
          selectionHandleColor: Colors.blue,
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.blue,
          onSecondary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
        // useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.grey,
          onPrimary: Colors.white,
          secondary: Colors.grey,
          onSecondary: Colors.black,
          surface: Colors.black,
          onSurface: Colors.white,
          error: Colors.red,
          onError: Colors.white,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: AppScreen(),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
