import 'package:design/src/ui/home/home.dart';
import 'package:design/src/ui/login/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Escola',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: Color(0xff424242),
        primarySwatch: Colors.blueGrey,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 20.0),
          title: TextStyle(fontSize: 14.0),
          subtitle: TextStyle(fontSize: 12.0),
          subhead: TextStyle(fontSize: 12.0),
          body1: TextStyle(fontSize: 12.0),
          body2: TextStyle(fontSize: 10.0),
        )
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}