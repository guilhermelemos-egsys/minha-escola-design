import 'package:design/src/ui/home/home.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class EntrarTurmaPage extends StatefulWidget {
  @override
  _EntrarTurmaPageState createState() => _EntrarTurmaPageState();
}

class _EntrarTurmaPageState extends State<EntrarTurmaPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 32.0),
            color: Colors.orange,
            child: Text(
              "Entrar",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        _buildCampoCodigo(),
        _buildBotaoEntrarNaTurma(),
      ],
    );
  }

  /// cria o layout do formulario de codigo
  Widget _buildCampoCodigo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: TextFormField(
          decoration: const InputDecoration(labelText: "Codigo"),
        ),
      ),
    );
  }

  Widget _buildBotaoEntrarNaTurma() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(8.0),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            ModalRoute.withName("/Home"));
        },
        color: theme.primaryColor,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Entrar na Turma",
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: theme.secondaryTextColor),
          ),
        ),
      ),
    );
  }
}