import 'package:ecommerce_flutter_app/models/product.dart';
import 'package:flutter/material.dart';
import '../models/cart_list.dart';

class ProductDetails extends StatefulWidget {
  Product product;
  ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final fontColor = 0xff121212;

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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(fontColor),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.00),
                            border: Border.all(
                              color: const Color(0xff06D6A0),
                              width: 2.5,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(200, 134, 214, 254),
                                  blurRadius: 5,
                                  spreadRadius: 0.05),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              '\$${widget.product.price.round()}',
                              style: const TextStyle(
                                fontSize: 50,
                                color: Color(0xff06D6A0),
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.00),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 197, 196, 196),
                                  blurRadius: 5,
                                  spreadRadius: 0.05),
                            ],
                          ),
                          padding: const EdgeInsets.all(12.00),
                          child: Text(
                            widget.product.descriptionDt,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(fontColor),
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
                          Icon(widget.product.bought
                              ? Icons.remove_shopping_cart
                              : Icons.shopping_cart, color: const Color(0xff118AB2),),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.product.bought
                                ? "R I M U O V I"
                                : "A C Q U I S T A",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff118AB2)),
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
                          ? const Icon(Icons.star, color: Color(0xffFFD166),)
                          : const Icon(Icons.star_outline, color: Color(0xffFFD166)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  acquisto(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text("Acquisto completato"),
          content: Text('Hai speso \$${widget.product.price.round()}'),
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
          content: Text('Hai rimosso ${widget.product.name} dal tuo carrello'),
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
    acquisto(context);
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
