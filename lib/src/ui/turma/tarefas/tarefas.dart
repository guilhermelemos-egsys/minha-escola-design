import 'package:design/src/domain/model/disciplina.dart';
import 'package:design/src/domain/model/tarefa.dart';
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/perfil/admin/disciplinas/disciplinas_admin_page.dart';
import 'package:design/src/ui/turma/tarefas/dialog_adicionar_tarefa.dart';
import 'package:design/src/ui/turma/tarefas/dialog_editar_tarefa.dart';
import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class TarefasPage extends StatefulWidget {
  @override
  _TarefasPageState createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  List<Tarefa> _tarefas = [
    Tarefa(
        descricao: "Trigonometria",
        disciplina: "Matemática",
        tipoTarefa: "Trabalho",
        data: "25 de setembro"),
    Tarefa(
        descricao: "Prova G1",
        disciplina: "Português",
        tipoTarefa: "Prova",
        data: "6 de setembro"),
  ];

  String _disciplinaHint = "Disciplina";

  Disciplina _disciplina;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              final result = dialogFactory.showDialog(
                context,
                MyDialog(
                  title: "Adicionar Tarefa",
                  content: DialogAdicionarTarefa(),
                  funConfirmar: _adicionarTarefa,
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
      body: ListView(children: <Widget>[
        HeaderPage(
          title: "Estas são suas tarefas",
          subtitle: "Não perca o foco, agende suas tarefas!",
        ),
        ..._tarefas.map((tarefa) {
          return _buildItemTarefa(tarefa);
        }).toList(),
      ]),
    );
  }

  Widget _buildItemTarefa(Tarefa tarefa) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(
            tarefa.descricao,
            style: Theme.of(context).textTheme.title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Row(
            children: <Widget>[
              MyWrap(conteudo: tarefa.disciplina),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: MyWrap(
                  conteudo: tarefa.data,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () async {
                  final result = dialogFactory.showDialog(
                    context,
                    MyDialog(
                      title: "Editar Tarefa",
                      content: DialogEditarTarefa(tarefa: tarefa),
                      funConfirmar: _editarTarefa,
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
                      content: _buildContentExcluirTarefa(),
                      funConfirmar: _excluirTarefa,
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

  Widget _buildContentExcluirTarefa() {
    return Text("Deseja realmente excluir esta tarefa?");
  }

  Function get _adicionarTarefa => () {
        Navigator.pop(context);
      };

  Function get _editarTarefa => () {
        Navigator.pop(context);
      };

  Function get _excluirTarefa => () {
        Navigator.pop(context);
      };
}
