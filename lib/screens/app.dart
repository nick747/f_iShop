import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart.dart';
import 'settings.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

var appBarColor = 0xff2155A2;
var primaryColor = 0xFFFFFFFF;
var secondaryColor = 0xff121212;
var primaryTColor = 0xff121212;
var secondaryTColor = 0xFFFFFFFF;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  static List<Widget> pages = <Widget>[];

  @override
  void initState() {
    super.initState();

    pages = <Widget>[
      HomeScreen(),
      CartScreen(),
      SettingsPage(notifySettingsChange: () => {setState(() {})}),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: (Settings.getValue<bool>('darkMode', defaultValue: false))! ? Color(secondaryColor) : Color(primaryColor),
        unselectedItemColor: (Settings.getValue<bool>('darkMode', defaultValue: false))! ? Color(primaryColor) : Colors.grey,
        currentIndex: _currentIndex,
          onTap: (index) => {
            setState(() {
              _currentIndex = index;
            })
          },
        selectedItemColor: Color(appBarColor),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.square),
            label: (Settings.getValue<bool>("language", defaultValue: false))! ? 'Products' : "Prodotti",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: (Settings.getValue<bool>("language", defaultValue: false))! ? 'Cart' : "Carrello",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: (Settings.getValue<bool>("language", defaultValue: false))! ? 'Settings' : "Impostazioni",
          ),
        ],
      ),
    );
  }
}
