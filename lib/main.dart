import 'screens/home_screen.dart';
import 'screens/app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Overpass',
      ),
  primaryTextTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'Overpass',
      ),
);

void main() {
  const app = ECommerceApp();
  runApp(app);
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
