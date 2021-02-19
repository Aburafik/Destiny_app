import 'package:destiny_app/screens/settings_page.dart';
import 'package:flutter/material.dart';
import '../interprater.dart';

class OpenPage extends StatefulWidget {
  final bool isDarkMode;
  OpenPage({this.isDarkMode = false});
  @override
  _OpenPageState createState() => _OpenPageState(isDarkMode: this.isDarkMode);
}

class _OpenPageState extends State<OpenPage> {
  _OpenPageState({this.isDarkMode});
  bool contentChecker = false;
  bool isDarkMode = false;

  String disk = "";
  String name = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController monthController = TextEditingController();

  AppBar appBar({String title}) {
    return AppBar(
      title: Text(title, style: TextStyle(fontFamily: "Pacifico-Regular")),
      automaticallyImplyLeading: false,
      actions: [
        PopupMenuButton(
          color: Colors.white,
          itemBuilder: (buildContext) => <PopupMenuEntry>[
            PopupMenuItem(
              textStyle: TextStyle(color: Colors.black),
              height: 4,
              child: InkWell(
                child: Text("Settings"),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SettingsPage())),
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem(
              textStyle: TextStyle(color: Colors.black),
              height: 4,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      contentChecker = false;
                      monthController.clear();
                      nameController.clear();
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Reset")),
            ),
          ],
        )
      ],
    );
  }

  Container _buildBody() {
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          fillTextFild(labelText: "Name", controller: nameController),
          fillTextFild(labelText: "Month", controller: monthController),
        ],
      ),
    );
  }

//TextField function
  Container fillTextFild({labelText, TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 10, right: 10),
      height: 30,
      width: 150,
      child: TextField(
        autocorrect: true,
        style: TextStyle(color: isDarkMode ? Colors.white : null),
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: isDarkMode ? InputBorder.none : null,
            filled: isDarkMode ? true : false,
            fillColor: isDarkMode ? Colors.grey : null,
            hintText: labelText,
            labelStyle: TextStyle(color: isDarkMode ? Colors.white : null)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: appBar(
        title: 'My Destiny',
      ),
      body: Center(
        child: ListView(
          children: [
            _buildBody(),
            // Spacer(),
            contentChecker
                ? displayResults()
                : Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Center(
                        child: Column(
                      children: [
                        Text("NO CONTENT YET",
                            style: TextStyle(
                                color: isDarkMode ? Colors.white : null)),
                        Icon(
                          Icons.search_off,
                          size: 60,
                          color: isDarkMode ? Colors.white : null,
                        )
                      ],
                    )),
                  ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.black,
        elevation: 2.0,
        onPressed: () {
          checker();
          interPreter(monthController.text);

          setState(() {
            disk = disc;
            name = nameController.text;
          });
          nameController.clear();
          monthController.clear();
        },
        child: Text("Scan"),
      ),
    );
  }

// Shows results after filling both name and month textfields
  Container displayResults() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isDarkMode ? null : Colors.teal,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.grey,
          )),
      child: Column(
        children: [
          Text(
            "$name".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: isDarkMode ? Colors.white : null),
          ),
          Text(
            "$disk",
            style: TextStyle(
                fontSize: 18, color: isDarkMode ? Colors.white : null),
          )
        ],
      ),
    );
  }

// show error dialog if textfiels are empty
  checker() {
    if (monthController.text.isEmpty && nameController.text.isEmpty) {
      contentChecker = false;

      AlertDialog alertDialog = AlertDialog(
        title: Text("Opps!!"),
        content: Text("Something went wrong, Try again"),
        actions: [
          FlatButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
        ],
      );
      return showDialog(context: context, builder: (_) => alertDialog);
    } else {
      contentChecker = true;
    }
  }
}
