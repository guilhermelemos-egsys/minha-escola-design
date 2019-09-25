import 'package:design/src/ui/adicionar_turma/adicionar_turma_page.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/home/home.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';

class AcessarTurmaPage extends StatefulWidget {
  @override
  _AcessarTurmaPageState createState() => _AcessarTurmaPageState();
}

class _AcessarTurmaPageState extends State<AcessarTurmaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Turmas"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdicionarTurmaPage()),
              );
            },
            child: Text(
              "Adicionar Turma",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          _buildItemTurma(),
        ],
      ),
    );
  }

  Widget _buildItemTurma() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: InkWell(
        onTap: _moveToHome,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: theme.primaryColor),
          child: Column(
            children: <Widget>[
              _buildHeaderItemTurma(),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "La Salle",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: theme.secondaryTextColor),
                    ),
                    _buildInfoAdminTurma()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderItemTurma() {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Container(
        padding: const EdgeInsets.only(
            left: 8.0, top: 8.0, right: 8.0, bottom: 24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
            color: theme.secondaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Turma 17A",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              "2019",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: theme.secondaryTextColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoAdminTurma() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Maria Fernanda",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: theme.secondaryTextColor),
            ),
            Text(
              "Administrador(a)",
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: theme.secondaryTextColor),
            ),
          ],
        ),
        SizedBox(width: 8.0),
        CircleAvatar(
          radius: 24.0,
          backgroundColor: theme.primaryLightColor,
          child: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Function get _moveToHome => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      };
}

class Turma {
  String descricao;
  String anoLetivo;
  String usuario;

  Turma({this.descricao, this.anoLetivo, this.usuario});
}
