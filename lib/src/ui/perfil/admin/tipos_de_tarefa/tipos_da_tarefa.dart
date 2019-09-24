import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:flutter/material.dart';

class TiposDeTarefaAdminPage extends StatefulWidget {
  @override
  _TiposDeTarefaPageState createState() => _TiposDeTarefaPageState();
}

class _TiposDeTarefaPageState extends State<TiposDeTarefaAdminPage> {
  List<TipoTarefa> _tiposTarefa = [
    TipoTarefa(descricao: "Prova"),
    TipoTarefa(descricao: "Trabalho"),
    TipoTarefa(descricao: "Lição de Casa"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos de Tarefa"),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              final result = dialogFactory.showDialog(
                context,
                MyDialog(
                  title: "Adicionar Tipo de Tarefa",
                  content: _buildContentAdicionarTipoTarefa(),
                  funConfirmar: _adicionarTipoTarefa,
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
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          HeaderPagesAdmin(
            count: _tiposTarefa.length,
            title: "Tipos de Tarefa Cadastrados",
          ),
          ..._tiposTarefa.map((tipoTarefa) {
            return _buildItemTipoTarefa(tipoTarefa);
          }).toList()
        ],
      ),
    );
  }

  Widget _buildItemTipoTarefa(TipoTarefa tipoTarefa) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(
            tipoTarefa.descricao,
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
                  final result = dialogFactory.showDialog(
                    context,
                    MyDialog(
                      title: "Editar Tipo de Tarefa",
                      content: _buildContentEditarTipoTarefa(tipoTarefa),
                      funConfirmar: _editarTipoTarefa,
                    ),
                  );
                  print(result);
                },
                icon: Icon(Icons.edit, size: 16.0, color: Colors.grey[700]),
              ),
              IconButton(
                onPressed: () async {
                  final result = dialogFactory.showDialog(
                    context,
                    MyDialog(
                      title: "Excluir Tipo de Tarefa",
                      content: _buildContentExcluirTipoTarefa(),
                      funConfirmar: _excluirTipoTarefa,
                      corBotaoConfirmar: Colors.red,
                    ),
                  );
                  print(result);
                },
                icon: Icon(Icons.delete, size: 16.0, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentAdicionarTipoTarefa() {
    return Form(
      child: TextFormField(
        decoration: InputDecoration(labelText: "Descrição"),
      ),
    );
  }

  Widget _buildContentEditarTipoTarefa(TipoTarefa tipoTarefa) {
    return Form(
      child: TextFormField(
        initialValue: tipoTarefa.descricao,
        decoration: InputDecoration(labelText: "Descrição"),
      ),
    );
  }

  Widget _buildContentExcluirTipoTarefa() {
    return Text("Deseja realmente excluir este tipo de tarefa?");
  }

  Function get _adicionarTipoTarefa => () {
        Navigator.pop(context);
      };

  Function get _editarTipoTarefa => () {
        Navigator.pop(context);
      };

  Function get _excluirTipoTarefa => () {
        Navigator.pop(context);
      };
}

class TipoTarefa {
  String descricao;

  TipoTarefa({this.descricao});
}
