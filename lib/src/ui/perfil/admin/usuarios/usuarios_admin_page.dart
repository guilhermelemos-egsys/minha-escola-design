import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/dialogs/my_dialog_visualizacao.dart';
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:flutter/material.dart';

class UsuariosAdminPage extends StatefulWidget {
  @override
  _UsuariosAdminPageState createState() => _UsuariosAdminPageState();
}

class _UsuariosAdminPageState extends State<UsuariosAdminPage> {
  List<Usuario> _usuarios = [
    Usuario(
        nome: "Guilherme",
        sobrenome: "Lemos",
        email: "guilherme.lemos@gmail.com"),
    Usuario(
        nome: "Marco Antônio",
        sobrenome: "Lentz",
        email: "marco.lentz@gmail.com"),
    Usuario(
        nome: "Mariana",
        sobrenome: "dos Santos Silva",
        email: "mariana.santos@gmail.com"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuários"),
      ),
      body: ListView(
        children: <Widget>[
          HeaderPagesAdmin(
            count: _usuarios.length,
            title: "Usuários vinculados à esta turma",
          ),
          ..._usuarios.map((usuario) {
            return _buildItemUsuario(usuario);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildItemUsuario(Usuario usuario) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20.0,
            child: Icon(Icons.person_outline),
          ),
          title: Text(
            '${usuario.nome} ${usuario.sobrenome}',
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.normal),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () async {
                  final result = await dialogFactory.showDialog(
                    context,
                    MyDialogVisualizacao(
                      title: "Informações de ${usuario.nome} ",
                      content: _buildContentVisualizarUsuario(usuario),
                      onSuccess: _visualizarUsuario,
                    ),
                  );
                  print(result);
                },
                icon: Icon(Icons.visibility,
                    size: 16.0, color: theme.primaryIconButtonColor),
              ),
              IconButton(
                onPressed: () async {
                  final result = await dialogFactory.showDialog(
                    context,
                    MyDialog(
                      title: "Excluir Usuário",
                      content: _buildContentDialogExcluirUsuario(usuario),
                      funConfirmar: _excluirUsuario,
                      corBotaoConfirmar: Colors.red,
                    ),
                  );
                  print(result);
                },
                icon: Icon(Icons.delete,
                    size: 16.0, color: theme.primaryIconButtonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentVisualizarUsuario(Usuario usuario) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 32.0,
          child: Icon(Icons.person_outline),
        ),
        SizedBox(height: 16.0),
        Text('${usuario.nome} ${usuario.sobrenome}',
            style: Theme.of(context).textTheme.title),
        SizedBox(height: 8.0),
        Text(usuario.email, style: Theme.of(context).textTheme.subhead),
      ],
    );
  }

  Widget _buildContentDialogVisualizarUsuario(Usuario usuario) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 3,
            shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: 45.0,
                      height: 45.0,
                      child: const CircleAvatar(
                        radius: 30.0,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.orange,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            usuario.email,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '${usuario.nome} ${usuario.sobrenome}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                width: 50.0,
                                height: 50.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue[700],
                                    child: const Center(
                                      child: const Text(
                                        "Facebook",
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50.0,
                                height: 50.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    child: const Center(
                                      child: const Text(
                                        "Google",
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 50.0,
                                height: 50.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.lightBlueAccent,
                                    child: const Center(
                                      child: const Text(
                                        "Twitter",
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentDialogExcluirUsuario(Usuario usuario) {
    return Container(
      child: Text(
          "Você realmente deseja excluir o usuario ${usuario.nome} ${usuario.sobrenome}? "),
    );
  }

  Function get _visualizarUsuario => () {
        Navigator.pop(context);
      };
  Function get _excluirUsuario => () {
        Navigator.pop(context);
      };
}

class Usuario {
  String nome;
  String sobrenome;
  String email;
  String login;
  String senha;

  Usuario({this.nome, this.sobrenome, this.email, this.login, this.senha});
}
