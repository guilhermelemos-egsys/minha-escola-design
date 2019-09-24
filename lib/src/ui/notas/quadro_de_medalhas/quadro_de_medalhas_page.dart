import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class QuadroDeMedalhas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[QuadroDeMedalhasPage()],
      ),
    );
  }
}

class QuadroDeMedalhasPage extends StatefulWidget {
  @override
  _QuadroDeMedalhasPageState createState() => _QuadroDeMedalhasPageState();
}

class _QuadroDeMedalhasPageState extends State<QuadroDeMedalhasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quadro de Medalhas"),
      ),
    );
  }
}
