// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_flutter_app/screens/product_details.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/product_list.dart';
import 'product_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showStarred = false;

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
                          'Clicca su un prodotto per avere più informazioni. Per salvarlo, clicca sul pulsante con la stella. Per filtrare i tuoi prodotto clicca sulla stellina in alto a destra nella schermata principale.'),
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
        backgroundColor: const Color(0xff3C79F5),
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
                      ? const Text("Preferiti")
                      : const Text("Prodotti"),
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
