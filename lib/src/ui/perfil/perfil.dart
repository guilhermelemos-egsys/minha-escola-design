import 'package:design/src/domain/model/usuario.dart';
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/domain/model/item_lista_menu.dart';
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/home/home.dart';
import 'package:design/src/ui/login/login_page.dart';
import 'package:design/src/ui/perfil/admin/admin_page.dart';
import 'package:flutter/material.dart';

import 'admin/usuarios/usuarios_admin_page.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  Usuario usuario = Usuario(
      nome: "Guilherme",
      sobrenome: "Lemos",
      email: "guilherme.lemos@gmail.com",
      login: "guilemos",
      senha: "123456");

  List<ItemListaMenu> _itensMenu = [];

  @override
  void initState() {
    _itensMenu = [
      ItemListaMenu(
          icone: Icons.person_outline,
          titulo: "Dados pessoais",
          onclick: _showDialogDadosPessoais),
      ItemListaMenu(
          icone: Icons.mail_outline,
          titulo: "E-mail",
          onclick: _showDialogEmail),
      ItemListaMenu(
          icone: Icons.lock_outline,
          titulo: "Alterar Senha",
          onclick: _showDialogAlterarSenha),
      ItemListaMenu(
          icone: Icons.exit_to_app, titulo: "Sair", onclick: _moveToLogin)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPage()),
              );
            },
            child: Text(
              "Administrador",
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
          _buildHeaderPerfil(),
          Divider(height: 0.0),
          ..._itensMenu.map((item) {
            return _buildItemLista(item);
          }).toList()
        ],
      ),
    );
  }

  Widget _buildHeaderPerfil() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 48.0,
            child: Icon(Icons.person_outline),
          ),
          SizedBox(height: 8.0),
          Text(
            "${usuario.nome} ${usuario.sobrenome}",
            style: Theme.of(context).textTheme.headline,
          ),
        ],
      ),
    );
  }

  Widget _buildItemLista(ItemListaMenu item) {
    return ListTile(
      onTap: item.onclick,
      leading: Icon(item.icone),
      title: Text(item.titulo),
    );
  }

  Function get _showDialogDadosPessoais => () {
        final result = dialogFactory.showDialog(
          context,
          MyDialog(
            title: "Editar Dados Pessoais",
            content: _buildContentEditarDadosPessoais(),
            funConfirmar: _editarDadosPessoais,
          ),
        );
      };

  Function get _showDialogEmail => () {
        final result = dialogFactory.showDialog(
          context,
          MyDialog(
            title: "Editar E-mail",
            content: _buildContentEditarEmail(),
            funConfirmar: _editarEmail,
          ),
        );
      };

  Function get _showDialogAlterarSenha => () {
        final result = dialogFactory.showDialog(
          context,
          MyDialog(
            title: "Alterar Senha",
            content: _buildContentAlterarSenha(),
            funConfirmar: _alterarSenha,
          ),
        );
      };

  Widget _buildContentEditarDadosPessoais() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: usuario.nome,
            decoration: InputDecoration(labelText: "Nome"),
          ),
          TextFormField(
            initialValue: usuario.sobrenome,
            decoration: InputDecoration(labelText: "Sobrenome"),
          ),
        ],
      ),
    );
  }

  Widget _buildContentEditarEmail() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: usuario.email,
            decoration: InputDecoration(labelText: "E-mail"),
          ),
        ],
      ),
    );
  }

  Widget _buildContentAlterarSenha() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Senha antiga"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Senha nova"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Confirmar senha nova"),
          ),
        ],
      ),
    );
  }

  Function get _editarDadosPessoais => () {
        Navigator.pop(context);
      };

  Function get _editarEmail => () {
        Navigator.pop(context);
      };

  Function get _alterarSenha => () {
        Navigator.pop(context);
      };

  Function get _moveToLogin => () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      };
}
