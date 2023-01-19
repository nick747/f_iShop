import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart.dart';

var appBarColor = 0xff3C79F5;

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
            const Text("iShop"),
            const Spacer(),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Aiuto'),
                      content: const Text(
                          'Clicca su un prodotto per avere più informazioni. Per salvarlo, clicca sul pulsante con la stella. Per filtrare i tuoi prodotti clicca sulla stellina in alto a destra nella schermata principale.'),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.help),
            )
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