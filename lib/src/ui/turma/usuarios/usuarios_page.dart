import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/dialogs/my_dialog_visualizacao.dart';
import 'package:design/src/ui/perfil/admin/usuarios/usuarios_admin_page.dart';
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:flutter/material.dart';
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
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

  Function get _visualizarUsuario => () {
        Navigator.pop(context);
      };
}