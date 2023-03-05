import 'package:ecommerce_flutter_app/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import '../utils/i18n.dart';

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
            getTextLanguage("settingsTitle", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
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
                title: getTextLanguage("settings1", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
                leading: const Icon(Icons.dark_mode),
                defaultValue: false,
                settingKey: 'darkMode',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              SwitchSettingsTile(
                title: getTextLanguage("settings2", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
                leading: const Icon(Icons.style),
                defaultValue: true,
                settingKey: 'material3',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              SwitchSettingsTile(
                title: getTextLanguage("settings3", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
                leading: const Icon(Icons.language),
                defaultValue: false,
                settingKey: 'language',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              RadioSettingsTile<int>(
                title: getTextLanguage("settings4Title", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
                settingKey: 'usedValue',
                values: <int, String>{
                  0: getTextLanguage("settings4a", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
                  1: getTextLanguage("settings4b", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
                  2: getTextLanguage("settings4c", (Settings.getValue<bool>("language", defaultValue: false))! ? 0 : 1),
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