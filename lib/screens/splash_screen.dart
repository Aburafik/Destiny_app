import 'dart:async';
import 'package:destiny_app/screens/home.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

@override
class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 5000),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OpenPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.cyanAccent,
              Colors.teal.shade400,
              Colors.yellow
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/dst.jpg'),
              ),
              Text(
                "MyDestiny",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: "Pacifico-Regular"),
              ),
              //  TextStyle(fontSize: 30),

              Spacer(),
              Text("loading please wait......")
            ],
          ),
        ),
      ),
    );
  }
}
