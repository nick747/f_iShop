import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart.dart';

var appBarColor = 0xff2155A2;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "iShop",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: 'Overpass'),
            ),
            const Spacer(),
            TextButton(
              child: const Text(
                "Help",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    fontFamily: 'Overpass'),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Aiuto',
                        style: TextStyle(
                          fontFamily: 'Overpass',
                        ),
                      ),
                      content: const Text(
                        'Clicca su un prodotto per avere più informazioni. Per salvarlo, clicca sul pulsante con la stella. Per filtrare i tuoi prodotti clicca sulla stellina in alto a destra nella schermata principale.',
                        style: TextStyle(
                          fontFamily: 'Overpass',
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text(
                            'Close',
                            style: TextStyle(
                              fontFamily: 'Overpass',
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(appBarColor),
      ),
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
        ],
      ),
    );
  }
}
