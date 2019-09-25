import 'package:design/src/domain/model/aviso.dart';
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:design/src/ui/widgets/my_expansion_tile.dart';
import 'package:flutter/material.dart';

class AvisosAdminPage extends StatefulWidget {
  @override
  _AvisosAdminPageState createState() => _AvisosAdminPageState();
}

class _AvisosAdminPageState extends State<AvisosAdminPage> {
  List<Aviso> _avisos = [
    Aviso(
        usuario: "Guilherme Lemos",
        titulo: "Prova de Matemática",
        conteudo: "Teremos prova de matemática dia 13/09 valendo "
            "4 pontos. A prova será sobre o conteúdo tal.",
        data: "25 de setembro"),
    Aviso(
        usuario: "Guilherme Lemos",
        titulo: "Trabalho de História",
        conteudo:
            "Teremos um trabalho de história valendo 2 pontos. Será em grupo, cada grupo "
            "terá no máximo 4 integrantes. A entrega é dia 23/09",
        data: "16 de setembro"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avisos"),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              final result = dialogFactory.showDialog(
                context,
                MyDialog(
                  title: "Adicionar Aviso",
                  content: _buildContentAdicionarAviso(),
                  funConfirmar: _adicionarAviso,
                ),
              );
              print(result);
            },
            child: Text(
              "Adicionar",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: theme.secondaryTextColor),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          HeaderPagesAdmin(
            count: _avisos.length,
            title: "Avisos Cadastrados",
          ),
          ..._avisos.map((aviso) {
            return _buildItemAviso(aviso);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildItemAviso(Aviso aviso) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: MyExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(aviso.titulo, style: Theme.of(context).textTheme.title),
                SizedBox(height: 4.0),
                Text("Postado por ${aviso.usuario}"),
              ],
            ),
          ),
          children: <Widget>[
            Divider(height: 0.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          child: Icon(Icons.person_outline),
                        ),
                      ),
                      Text(
                        aviso.usuario,
                        style: Theme.of(context).textTheme.title,
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () async {
                          final result = dialogFactory.showDialog(
                            context,
                            MyDialog(
                              title: "Editar Tarefa",
                              content: _buildContentEditarAviso(aviso),
                              funConfirmar: _editarAviso,
                            ),
                          );
                          print(result);
                        },
                        icon: Icon(Icons.edit,
                            size: 16.0, color: theme.primaryIconButtonColor),
                      ),
                      IconButton(
                        onPressed: () async {
                          final result = dialogFactory.showDialog(
                            context,
                            MyDialog(
                              title: "Excluir Tarefa",
                              content: _buildContentExcluirAviso(),
                              funConfirmar: _excluirAviso,
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
                  SizedBox(height: 16.0),
                  Text(
                    aviso.titulo,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    aviso.conteudo,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  SizedBox(height: 16.0),
                  Text("Postado em ${aviso.data}",
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.grey[700]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentAdicionarAviso() {
    return Form(
        child: Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: "Título"),
          maxLength: 50,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Conteudo"),
          maxLength: 500,
          maxLines: 3,
        ),
      ],
    ));
  }

  Widget _buildContentEditarAviso(Aviso aviso) {
    return Form(
        child: Column(
      children: <Widget>[
        TextFormField(
          initialValue: aviso.titulo,
          decoration: InputDecoration(labelText: "Título"),
          maxLength: 50,
        ),
        TextFormField(
          initialValue: aviso.conteudo,
          decoration: InputDecoration(labelText: "Conteudo"),
          maxLength: 500,
          maxLines: 3,
        ),
      ],
    ));
  }

  Widget _buildContentExcluirAviso() {
    return Text("Deseja realmente excluir este aviso?");
  }

  Function get _adicionarAviso => () {
        Navigator.pop(context);
      };

  Function get _editarAviso => () {
        Navigator.pop(context);
      };

  Function get _excluirAviso => () {
        Navigator.pop(context);
      };
}
