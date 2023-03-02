import 'package:ecommerce_flutter_app/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatefulWidget {
  final Function() notifySettingsChange;
  const SettingsPage({
    Key? key,
    required this.notifySettingsChange,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  // var darkMode = (Settings.getValue<bool>('darkMode', defaultValue: false))!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: (Settings.getValue<bool>('darkMode', defaultValue: false))!
          ? ThemeData.dark(
              useMaterial3:
                  (Settings.getValue<bool>('material3', defaultValue: true))!
                      ? true
                      : false,
            )
          : ThemeData.light(
              useMaterial3:
                  (Settings.getValue<bool>('material3', defaultValue: true))!
                      ? true
                      : false,
            ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Overpass',
            ),
          ),
          backgroundColor: (Settings.getValue<bool>('darkMode', defaultValue: false))! ? Color(secondaryColor) : Color(appBarColor),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SwitchSettingsTile(
                title: 'Dark Mode',
                leading: const Icon(Icons.dark_mode),
                defaultValue: false,
                settingKey: 'darkMode',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              SwitchSettingsTile(
                title: 'Use Material 3',
                leading: const Icon(Icons.outlined_flag),
                defaultValue: true,
                settingKey: 'material3',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              RadioSettingsTile<int>(
                title: 'Valuta utilizzata',
                settingKey: 'usedValue',
                values: const <int, String>{
                  0: '\$ Dollari',
                  1: '€ Euro',
                  2: '£ Sterline',
                },
                selected: 0,
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}