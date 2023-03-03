import 'package:ecommerce_flutter_app/screens/app.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../screens/settings.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final Function(Product)? onTap;
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;
  var value = (Settings.getValue<int>('usedValue', defaultValue: 0))!;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap != null ? widget.onTap!(widget.product) : null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: darkMode ? Color(secondaryColor) : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Overpass',),
                    ),
                    Text(
                      (Settings.getValue<bool>("language", defaultValue: false))! ? widget.product.description_en : widget.product.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontFamily: 'Overpass',),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: darkMode ? const Color(0xff030303) : const Color(0xff06D6A0),
                  ),
                  child: Center(
                    child: Text(
                      (value == 0) ? '\$${widget.product.price_dollar.round()}' : ((value == 1) ? '€${widget.product.price_euro.round()}' : '£${widget.product.price_pound.round()}'),
                      //'\$${widget.product.price.round()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Overpass',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
