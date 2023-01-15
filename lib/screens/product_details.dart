import 'package:ecommerce_flutter_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // backgroundColor: const Color(0xff3C79F5),
                backgroundColor: Colors.white,
                stretch: true,
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 160.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(''),
                  background: Image.asset(
                    product.imageUrlDt,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Color(0xff363636),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        product.descriptionDt,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xff363636)
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                checkout(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2DCDDF),
              ),
              child: const Text(
                "Acquista",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  checkout(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("Acquisto completato"),
          actions: [
            TextButton(
                onPressed: (() => Navigator.pop(context)), child: const Text("Ok"))
          ],
        );
      }),
    );
  }
}
