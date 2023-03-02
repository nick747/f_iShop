// ignore_for_file: use_key_in_widget_constructors
import 'package:ecommerce_flutter_app/screens/product_details.dart';
import 'package:flutter/material.dart';
import './app.dart';
import '../models/product.dart';
import '../models/product_list.dart';
import 'product_card.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showStarred = false;

  var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;
  var material3 = (Settings.getValue<bool>('material3', defaultValue: false))!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkMode
          ? ThemeData.dark(
              useMaterial3: material3 ? true : false,
            )
          : ThemeData.light(
              useMaterial3: material3 ? true : false,
            ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          backgroundColor:
              darkMode ? Color(secondaryColor) : Color(appBarColor),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 8, left: 8, right: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showStarred
                        ? const Text(
                            "Preferiti",
                            style: TextStyle(
                              fontFamily: 'Overpass',
                            ),
                          )
                        : const Text("Prodotti",
                            style: TextStyle(
                              fontFamily: 'Overpass',
                            )),
                    IconButton(
                      icon: Icon(showStarred ? Icons.star : Icons.star_outline),
                      onPressed: () {
                        showStarred = !showStarred;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  child: Column(
                    children:
                        buildProductCards(productList, context, showStarred),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ProductCard> buildProductCards(
      List<Product> productList, BuildContext context, bool showStarred) {
    List<ProductCard> productCards = [];
    for (var product in productList) {
      if (!showStarred || (showStarred && product.starred)) {
        final productCard = ProductCard(
            product: product,
            onTap: (product) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: product,
                  ),
                ),
              );
            });

        productCards.add(productCard);
      }
    }

    return productCards;
  }
}
