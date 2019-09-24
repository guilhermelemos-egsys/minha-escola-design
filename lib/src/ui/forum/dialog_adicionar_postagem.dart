import 'package:flutter/material.dart';

class DialogAdicionarPostagem extends StatefulWidget {
  @override
  _DialogAdicionarPostagemState createState() => _DialogAdicionarPostagemState();
}

class _DialogAdicionarPostagemState extends State<DialogAdicionarPostagem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: "O que você deseja postar?"
          ),
          maxLines: 3,
          maxLength: 500,
        ),
      ],
    );
  }
}