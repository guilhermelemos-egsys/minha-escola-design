import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/perfil/admin/disciplinas/disciplinas_admin_page.dart';
import 'package:design/src/ui/perfil/admin/tipos_de_tarefa/tipos_da_tarefa.dart';
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';

class TarefasAdminPage extends StatefulWidget {
  @override
  _TarefasAdminPageState createState() => _TarefasAdminPageState();
}

class _TarefasAdminPageState extends State<TarefasAdminPage> {
  List<Tarefa> _tarefas = [
    Tarefa(
        descricao: "Prova G1",
        disciplina: "Português",
        tipoTarefa: "Prova",
        data: "6 Setembro"),
    Tarefa(
        descricao: "Trigonometria",
        disciplina: "Matemática",
        tipoTarefa: "Trabalho",
        data: "6 Maio"),
  ];

  String _disciplinaHint = "Disciplina";

  Disciplina _disciplina;

  List<Disciplina> _disciplinas = [
    Disciplina("Matemática", "José da Silva"),
    Disciplina("Português", "Maria da Silva"),
    Disciplina("Geografia", "Camila da Silva"),
    Disciplina("Ciências", "André da Silva")
  ];

  String _tipoTarefaHint = "Tipo de Tarefa";

  TipoTarefa _tipoTarefa;

  List<TipoTarefa> _tiposTarefa = [
    TipoTarefa(descricao: "Prova"),
    TipoTarefa(descricao: "Trabalho"),
    TipoTarefa(descricao: "Lição de Casa"),
  ];
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
                  content: _buildContentAdicionarTarefa(),
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
        HeaderPagesAdmin(
          count: _tarefas.length,
          title: "Tarefas Cadastradas",
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
                child: MyWrap(conteudo: tarefa.tipoTarefa),
              ),
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
                      content: _buildContentEditarTarefa(tarefa),
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

  Widget _buildContentAdicionarTarefa() {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Descrição"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Disciplina"),
              DropdownButton(
                value: _disciplina,
                hint: Text(_disciplinaHint),
                onChanged: ((Disciplina disciplinaSelecionada) {
                  setState(() {
                    _disciplina = disciplinaSelecionada;
                    _disciplinaHint = _disciplina.nome;
                  });
                }),
                items: _disciplinas
                    .map(
                      (disciplina) => DropdownMenuItem(
                        child: Text(disciplina.nome),
                        value: disciplina,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Tipo de Tarefa"),
              DropdownButton(
                value: _tipoTarefa,
                hint: Text(_tipoTarefaHint),
                onChanged: ((TipoTarefa tipoTarefaSelecionado) {
                  setState(() {
                    _tipoTarefa = tipoTarefaSelecionado;
                    _tipoTarefaHint = _tipoTarefa.descricao;
                  });
                }),
                items: _tiposTarefa
                    .map(
                      (tipoTarefa) => DropdownMenuItem(
                        child: Text(tipoTarefa.descricao),
                        value: tipoTarefa,
                      ),
                    )
                    .toList(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildContentEditarTarefa(Tarefa tarefa) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: tarefa.descricao,
            decoration: InputDecoration(labelText: "Descrição"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Disciplina"),
              DropdownButton(
                value: _disciplina,
                hint: Text(tarefa.disciplina),
                onChanged: ((Disciplina disciplinaSelecionada) {
                  setState(() {
                    _disciplina = disciplinaSelecionada;
                    _disciplinaHint = _disciplina.nome;
                  });
                }),
                items: _disciplinas
                    .map(
                      (disciplina) => DropdownMenuItem(
                        child: Text(disciplina.nome),
                        value: disciplina,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Tipo de Tarefa"),
              DropdownButton(
                value: _tipoTarefa,
                hint: Text(tarefa.tipoTarefa),
                onChanged: ((TipoTarefa tipoTarefaSelecionado) {
                  setState(() {
                    _tipoTarefa = tipoTarefaSelecionado;
                    _tipoTarefaHint = _tipoTarefa.descricao;
                  });
                }),
                items: _tiposTarefa
                    .map(
                      (tipoTarefa) => DropdownMenuItem(
                        child: Text(tipoTarefa.descricao),
                        value: tipoTarefa,
                      ),
                    )
                    .toList(),
              ),
            ],
          )
        ],
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

class Tarefa {
  String descricao;
  String disciplina;
  String tipoTarefa;
  String data;

  Tarefa({this.descricao, this.disciplina, this.tipoTarefa, this.data});
}