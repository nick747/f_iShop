import 'package:ecommerce_flutter_app/models/product.dart';
import 'package:ecommerce_flutter_app/screens/app.dart';
import 'package:ecommerce_flutter_app/screens/cart.dart';
import 'package:flutter/material.dart';
import '../models/cart_list.dart';
import '../utils/i18n.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../screens/settings.dart';


var langI = 0;
var priceI = 0;
class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;
  var material3 = (Settings.getValue<bool>('material3', defaultValue: true))!;
  var value = (Settings.getValue<int>('usedValue', defaultValue: 0))!;

  @override
  Widget build(BuildContext context) {
    langI = (Settings.getValue<int>("lang", defaultValue: 0))!;
    priceI = (Settings.getValue<int>("usedValue", defaultValue: 0))!;

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
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    stretch: true,
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: 160.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text(' '),
                      background: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Image.asset(
                          widget.product.imageUrlDt,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              widget.product.name,
                              style: TextStyle(
                                fontSize: 30,
                                color: darkMode
                                    ? Color(secondaryTColor)
                                    : Color(primaryTColor),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Overpass',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: darkMode
                                  ? Color(secondaryColor)
                                  : Color(primaryColor),
                              borderRadius: BorderRadius.circular(10.00),
                              border: Border.all(
                                color: const Color(0xff06D6A0),
                                width: 2.5,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(100, 134, 214, 254),
                                    blurRadius: 5,
                                    spreadRadius: .05),
                              ],
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                curPrices(priceI) + widget.product.price[priceI].round().toString(),
                                style: const TextStyle(
                                  fontSize: 50,
                                  color: Color(0xff06D6A0),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Overpass',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: darkMode
                                  ? Color(secondaryColor)
                                  : Color(primaryColor),
                              borderRadius: BorderRadius.circular(10.00),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(100, 197, 196, 196),
                                    blurRadius: 5,
                                    spreadRadius: 0.05),
                              ],
                            ),
                            padding: const EdgeInsets.all(12.00),
                            child: Text(
                              widget.product.description[langI],
                              style: TextStyle(
                                fontSize: 18,
                                color: darkMode
                                    ? Color(secondaryTColor)
                                    : Color(primaryTColor),
                                fontFamily: 'Overpass',
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
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: OutlinedButton(
                        onPressed: () {
                          widget.product.bought ? rimuovi() : aggiungi();
                          widget.product.bought = !widget.product.bought;
                          setState(() {});
                        },
                        onLongPress: () => easterEgg(context),
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xff118AB2),
                            width: 3.0,
                          ),
                          padding: const EdgeInsets.all(8),
                          // backgroundColor: const ,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              widget.product.bought
                                  ? Icons.remove_shopping_cart
                                  : Icons.shopping_cart,
                              color: const Color(0xff118AB2),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.product.bought ? getTextLanguage("purchaseButton2", langI) : getTextLanguage("purchaseButton1", langI),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(
                                  0xff118AB2,
                                ),
                                fontFamily: 'Overpass',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {
                          widget.product.starred = !widget.product.starred;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xffFFD166),
                            width: 3.0,
                          ),
                          padding: const EdgeInsets.all(11),
                        ),
                        child: widget.product.starred
                            ? const Icon(
                                Icons.star,
                                color: Color(0xffFFD166),
                              )
                            : const Icon(Icons.star_outline,
                                color: Color(0xffFFD166)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  acquisto(BuildContext context, int value, int language) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: Text(getTextLanguage("purchaseMessage", language)),
          content: Text(
            getTextLanguage("promtMessage", langI) + curPrices(priceI) + (widget.product.price[priceI].round()).toString(),
          ),
          actions: [
            TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text("Ok"))
          ],
        );
      }),
    );
  }

  rimborso(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("Rimozione Completata"),
          content: Text(
            getTextLanguage("refundMessage", langI) + widget.product.name + getTextLanguage("refundMessageB", langI),
                    ),
          actions: [
            TextButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text("Ok"))
          ],
        );
      }),
    );
  }

  aggiungi() {
    acquisto(context, value, langI);
    cart.add(widget.product);
  }

  rimuovi() {
    rimborso(context);
    cart.remove(widget.product);
  }

  easterEgg(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("Easter Egg"),
          content: const Text('Hai trovato l\'easter egg, complimenti'),
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
