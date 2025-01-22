import 'package:flutter/material.dart';
import '../pages/homepage.dart';
import '../pages/all_tools.dart';
import '../pages/settings.dart';
import '../pages/license_page.dart';
import '../pages/about.dart';
import '../pages/output_page.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
      case 1:
        page = ServiceGridPage();
      case 2:
        page = SettingsPage();
      case 3:
        page = ActivationPage();
      case 4:
        page = AboutPage();
      case 5:
        page = OutputsPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    final Color backgroundColor =
        Theme.of(context).colorScheme.surface == Colors.white
            ? Colors.grey.shade200
            : Colors.grey.shade900;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                minExtendedWidth: 225,
                backgroundColor: backgroundColor,
                extended: constraints.maxWidth >= 800,
                leading: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Pimosa',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    selectedIcon: Icon(Icons.home_outlined),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_bag),
                    selectedIcon: Icon(Icons.shopping_bag_outlined),
                    label: Text('All tools'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    selectedIcon: Icon(Icons.settings_outlined),
                    label: Text('Settings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.key),
                    selectedIcon: Icon(Icons.key_outlined),
                    label: Text('Licence'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.info_outline),
                    selectedIcon: Icon(Icons.info),
                    label: Text('About'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.science_outlined),
                    selectedIcon: Icon(Icons.science),
                    label: Text('Outputs'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}