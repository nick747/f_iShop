import 'screens/home_screen.dart';
import 'screens/app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  const app = ECommerceApp();
  runApp(app);
}
class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // fontFamily: GoogleFonts.getFont('Poppins').fontFamily,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}