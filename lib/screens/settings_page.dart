import 'package:destiny_app/screens/home.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  SettingsPage({this.isDarkMode = false});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Settings"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OpenPage(
                isDarkMode: isDarkMode,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Dark Mode"),
            trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                }),
          ),
          Divider(
            height: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
