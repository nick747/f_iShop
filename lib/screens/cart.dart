// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_flutter_app/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import '../models/product.dart';
import '../models/cart_list.dart';
import 'product_card.dart';
import 'settings.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';


var priceI = 0;
class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showStarred = false;

  var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;
  var material3 = (Settings.getValue<bool>('material3', defaultValue: true))!;

  @override
  Widget build(BuildContext context) {
    if ((Settings.getValue<int>("usedValue", defaultValue: 0))! == 1) {
      priceI = 1;
    } else if ((Settings.getValue<int>("usedValue", defaultValue: 0))! == 2) {
      priceI = 2;
    } else {
      priceI = 0;
    }
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
                          (Settings.getValue<bool>("language", defaultValue: false))! ? "Help" : 'Aiuto',
                          style: const TextStyle(
                            fontFamily: 'Overpass',
                          ),
                        ),
                        content: Text(
                          (Settings.getValue<bool>("language", defaultValue: false))! ? "Click on a product for more information. To save it, click on the star button. To filter your products, click on the star at the top right of the main screen." : 'Clicca su un prodotto per avere più informazioni. Per salvarlo, clicca sul pulsante con la stella. Per filtrare i tuoi prodotti clicca sulla stellina in alto a destra nella schermata principale.',
                          style: const TextStyle(
                            fontFamily: 'Overpass',
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text(
                              (Settings.getValue<bool>("language", defaultValue: false))! ? "Close" : "Chiudi",
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
                const SizedBox(
                  height: 10,
                ),
                const PrezzoCarrello(),
                const SizedBox(
                  height: 5,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: buildProductCards(cart, context, showStarred),
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

    return productCards;
  }
}

class PrezzoCarrello extends StatefulWidget {
  const PrezzoCarrello({
    Key? key,
  }) : super(key: key);

  @override
  State<PrezzoCarrello> createState() => _PrezzoCarrelloState();
}

class _PrezzoCarrelloState extends State<PrezzoCarrello> {
  var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;
  var value = (Settings.getValue<int>('usedValue', defaultValue: 0))!;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: darkMode
                      ? Color(secondaryColor)
                      : const Color(0xff06D6A0),
                  width: 3,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Center(
              child: Column(
                children: [
                  Text(
                    '${cart.length}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Overpass',
                    ),
                  ),
                  Text(
                    (Settings.getValue<bool>("language", defaultValue: false))! ? "Products" : 'Prodotti',
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Overpass',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                  color: darkMode
                      ? Color(secondaryColor)
                      : const Color(0xff06D6A0),
                  width: 2.5,
                ),
                color:
                    darkMode ? Color(secondaryColor) : const Color(0xff06D6A0),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Center(
              child: Text(
                "${curPrices(priceI)}${sumPrices(priceI).round()}",
                style: const TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Overpass',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

double sumPrices(int priceI) {
  double sum = 0;

  for (int i = 0; i < price.length; i++) {
    sum += price[priceI]![i];
  }

  return sum;
}


String curPrices(int priceI) {
  return ((priceI == 0) ? "\$" : ((priceI == 1) ? "€" : "£"));
}