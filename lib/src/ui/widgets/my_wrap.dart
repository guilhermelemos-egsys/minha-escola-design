import 'package:flutter/material.dart';

class MyWrap extends StatelessWidget {
  final String conteudo;
  final Color color;

  MyWrap({this.conteudo, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 8.0, top: 4.0, right: 8.0, bottom: 4.0),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Text(
        conteudo,
        style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white),
      ),
    );
  }
}
