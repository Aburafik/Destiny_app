import 'package:destiny_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

const Color barColor = const Color(0x20000000);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: barColor,
          ),
          primarySwatch: Colors.blue,
          bottomAppBarColor: barColor,
        ),
        home: SplashPage()
        // OpenPage()
        );
  }
}
