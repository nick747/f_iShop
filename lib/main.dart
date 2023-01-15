import 'screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  const app = ECommerceApp();
  runApp(app);
}
class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}