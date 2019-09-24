import 'package:design/src/ui/acessar_turma/acessar_turma_page.dart';
import 'package:design/src/ui/home/home.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AcessarTurmaPage()),
                  ModalRoute.withName("/Turmas"));
            },
            child: Text(
              "Concluir Cadastro",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildHeader(),
          _buildCamposCadastro(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [theme.secondaryLightColor, theme.secondaryColor],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Center(
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 3.0, color: theme.primaryLightColor),
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.white),
              child: Icon(
                Icons.add_a_photo,
                size: 48.0,
                color: theme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCamposCadastro() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Nome"),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Sobrenome"),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(labelText: "E-mail"),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Usuário"),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Senha"),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(labelText: "Confirmar Senha"),
            ),
          ],
        ),
      ),
    );
  }
}
