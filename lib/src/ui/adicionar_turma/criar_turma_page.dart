import 'package:design/src/ui/home/home.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class CriarTurmaPage extends StatefulWidget {
  @override
  _CriarTurmaPageState createState() => _CriarTurmaPageState();
}

class _CriarTurmaPageState extends State<CriarTurmaPage> {
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
              "Criar",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        _buildFormCriarTurma(),
        _buildBotaoCriarTurma()
      ],
    );
  }

  /// cria o formulario para criar a turma
  Widget _buildFormCriarTurma() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "Descrição"),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Ano"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotaoCriarTurma() {
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
            "Criar Turma",
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