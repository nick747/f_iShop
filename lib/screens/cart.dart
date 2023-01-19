// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_flutter_app/screens/product_details.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/cart_list.dart';
import 'product_card.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showStarred = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      : const Text("Carrello"),
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
                      buildProductCards(cart, context, showStarred),
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
