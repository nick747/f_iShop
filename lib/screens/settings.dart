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
          title: Text(
            (Settings.getValue<bool>("language", defaultValue: false))! ? "Settings" : "Impostazioni",
            style: const TextStyle(
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
                title: (Settings.getValue<bool>("language", defaultValue: false))! ? "Dark Mode" : "Modalità Scura",
                leading: const Icon(Icons.dark_mode),
                defaultValue: false,
                settingKey: 'darkMode',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              SwitchSettingsTile(
                title: (Settings.getValue<bool>("language", defaultValue: false))! ? "Modern Style" : "Stile Moderno",
                leading: const Icon(Icons.style),
                defaultValue: true,
                settingKey: 'material3',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              SwitchSettingsTile(
                title: (Settings.getValue<bool>("language", defaultValue: false))! ? "English" : "Inglese",
                leading: const Icon(Icons.language),
                defaultValue: false,
                settingKey: 'language',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              RadioSettingsTile<int>(
                title: (Settings.getValue<bool>("language", defaultValue: false))! ? "Currency Used" : "Valuta Utilizzata",
                settingKey: 'usedValue',
                values: <int, String>{
                  0: (Settings.getValue<bool>("language", defaultValue: false))! ? "\$ Dollars" : "\$ Dollari",
                  1: (Settings.getValue<bool>("language", defaultValue: false))! ? "€ Euros" : "€ Euro",
                  2: (Settings.getValue<bool>("language", defaultValue: false))! ? "£ Pounds" : "£ Sterline",
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