import 'package:design/src/domain/model/usuario.dart';
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
        nome: "Maria Fernanda",
        sobrenome: "Lima",
        email: "maria.ribeirolima@soulasalle.com.br"),
    Usuario(
        nome: "Juliana",
        sobrenome: "Ederich",
        email: "juliana.ederich@soulasalle.com.br"),
    Usuario(
        nome: "Mariana",
        sobrenome: "Salvador",
        email: "mariana.boeira@soulasalle.com.br"),
    Usuario(
        nome: "Nathalie",
        sobrenome: "Bastos",
        email: "nathalie.bastos@soulasalle.com.br"),
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
