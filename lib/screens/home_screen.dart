// ignore_for_file: use_key_in_widget_constructors
import 'package:ecommerce_flutter_app/screens/product_details.dart';
import 'package:flutter/material.dart';
import './app.dart';
import '../models/product.dart';
import 'product_card.dart';
import '../utils/i18n.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showStarred = false;

  var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;
  var material3 = (Settings.getValue<bool>('material3', defaultValue: true))!;

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
                        title: Text(
                          (Settings.getValue<bool>("language",
                                  defaultValue: false))!
                              ? "Help"
                              : 'Aiuto',
                          style: const TextStyle(
                            fontFamily: 'Overpass',
                          ),
                        ),
                        content: Text(
                          getTextLanguage(
                              "helpMessage",
                              (Settings.getValue<bool>("language",
                                      defaultValue: false))!
                                  ? 1
                                  : 0),
                          style: const TextStyle(
                            fontFamily: 'Overpass',
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text(
                              (Settings.getValue<bool>("language",
                                      defaultValue: false))!
                                  ? "Close"
                                  : "Chiudi",
                              style: const TextStyle(
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
                        ? Text(getTextLanguage("favourites", (Settings.getValue<int>("lang", defaultValue: 0))!),
                            style: const TextStyle(
                              fontFamily: 'Overpass',
                            ),
                          )
                        : Text(getTextLanguage("products", (Settings.getValue<int>("lang", defaultValue: 0))!),
                            style: const TextStyle(
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
