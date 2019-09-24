import 'package:design/src/ui/acessar_turma/acessar_turma_page.dart';
import 'package:design/src/ui/cadastro/cadastro_page.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/home/home.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[_buildHeader(), _buildCamposLogin()],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 200.0,
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
          padding: const EdgeInsets.only(top: 150.0, left: 32.0),
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: theme.primaryLightColor),
                borderRadius: BorderRadius.circular(100.0),
                color: Colors.white),
            child: Icon(
              Icons.school,
              size: 64.0,
              color: theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCamposLogin() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline), labelText: "Usuário"),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline), labelText: "Senha"),
          ),
          SizedBox(height: 32.0),
          _buildBotaoAcessar(),
          SizedBox(height: 8.0),
          _buildBotaoCadastrar()
        ],
      ),
    );
  }

  Widget _buildBotaoAcessar() {
    return Container(
      height: 48.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: theme.secondaryColor,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: _moveToAcessarTurmas,
        child: Text(
          "Acessar",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: theme.secondaryTextColor),
        ),
      ),
    );
  }

  Widget _buildBotaoCadastrar() {
    return Container(
      height: 48.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: theme.primaryColor,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: _moveToCadastro,
        child: Text(
          "Cadastre-se!",
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(color: theme.secondaryTextColor),
        ),
      ),
    );
  }

  Function get _moveToAcessarTurmas => () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AcessarTurmaPage()),
        );
      };

  Function get _moveToCadastro => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CadastroPage()),
        );
      };
}
