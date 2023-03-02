import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart.dart';
import 'settings.dart';

var appBarColor = 0xff2155A2;
var primaryColor = 0xffFFFF;
var secondaryColor = 0xff121212;
var primaryTColor = 0xff121212;
var secondaryTColor = 0xffFFFF;

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
      SettingsScreen(notifySettingsChange: () => {setState(() {})}),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(appBarColor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.square),
            label: 'Prodotti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrello',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Impostazioni',
          ),
        ],
      ),
    );
  }
}
