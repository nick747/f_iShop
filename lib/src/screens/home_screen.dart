// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_flutter_app/src/screens/product_details.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../models/product_list.dart';
import 'product_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iShop'),
        centerTitle: true,
        backgroundColor: const Color(0xff3C79F5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: buildProductCards(productList, context),
          ),
        ),
      ),
    );
  }

  List<ProductCard> buildProductCards(
      List<Product> productList, BuildContext context) {
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
