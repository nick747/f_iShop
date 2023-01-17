import 'package:ecommerce_flutter_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  stretch: true,
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: 160.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text(' '),
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
                              color: Color(0xff121212),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(200, 134, 214, 254),
                            borderRadius: BorderRadius.circular(10.00),
                            border: Border.all(
                              color: const Color.fromARGB(255, 134, 214, 254),
                              width: 3,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(200, 134, 214, 254),
                                  blurRadius: 3,
                                  spreadRadius: 0.5),
                            ],
                          ),
                          padding: const EdgeInsets.all(10.00),
                          child: Text(
                            product.descriptionDt,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff363636),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(200, 60, 245, 91),
                            borderRadius: BorderRadius.circular(10.00),
                            border: Border.all(
                              color: const Color.fromARGB(255, 60, 245, 91),
                              width: 3,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(200, 134, 214, 254),
                                  blurRadius: 3,
                                  spreadRadius: 0.5),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              '\$${product.price.round()}',
                              style: const TextStyle(
                                fontSize: 50,
                                color: Color(0xff363636),
                              ),
                            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.shopping_cart),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "A C Q U I S T A",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  checkout(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("Acquisto completato"),
          content: Text('Hai speso \$${product.price.round()}'),
          actions: [
            TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text("Ok"))
          ],
        );
      }),
    );
  }
}
