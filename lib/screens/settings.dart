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
            getTextLanguage("settingsTitle",
                (Settings.getValue<int>("lang", defaultValue: 0))!),
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Overpass',
            ),
          ),
          backgroundColor:
              (Settings.getValue<bool>('darkMode', defaultValue: false))!
                  ? Color(secondaryColor)
                  : Color(appBarColor),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SwitchSettingsTile(
                title: getTextLanguage("settings1",
                    (Settings.getValue<int>("lang", defaultValue: 0))!),
                leading: const Icon(Icons.dark_mode),
                defaultValue: false,
                settingKey: 'darkMode',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              SwitchSettingsTile(
                title: getTextLanguage("settings2",
                    (Settings.getValue<int>("lang", defaultValue: 0))!),
                leading: const Icon(Icons.style),
                defaultValue: true,
                settingKey: 'material3',
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              DropDownSettingsTile<int>(
                settingKey: 'lang',
                title: getTextLanguage("settings4title",
                    Settings.getValue<int>("lang", defaultValue: 0)!),
                selected: 0,
                values: <int, String>{
                  0: getTextLanguage("settings4a",
                      Settings.getValue<int>("lang", defaultValue: 0)!),
                  1: getTextLanguage("settings4b",
                      Settings.getValue<int>("lang", defaultValue: 0)!),
                  2: getTextLanguage("settings4c",
                      Settings.getValue<int>("lang", defaultValue: 0)!),
                },
                onChange: (value) {
                  setState(() {});
                  widget.notifySettingsChange();
                },
              ),
              DropDownSettingsTile<int>(
                title: getTextLanguage("settings5title",
                    (Settings.getValue<int>("lang", defaultValue: 0))!),
                settingKey: 'usedValue',
                values: <int, String>{
                  0: getTextLanguage("settings5a",
                      (Settings.getValue<int>("lang", defaultValue: 0))!),
                  1: getTextLanguage("settings5b",
                      (Settings.getValue<int>("lang", defaultValue: 0))!),
                  2: getTextLanguage("settings5c",
                      Settings.getValue<int>("lang", defaultValue: 0)!),
                },
                selected: 1,
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
