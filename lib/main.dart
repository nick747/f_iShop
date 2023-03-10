import 'screens/home_screen.dart';
import 'screens/app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import './screens/settings.dart';

void main() {
  const app = ECommerceApp();
  initSettings().then((_) {
    runApp(app);
  });
}

Future initSettings() async {
  await Settings.init(
    cacheProvider: SharePreferenceCache(),
  );
}

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({super.key});

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {

  var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
