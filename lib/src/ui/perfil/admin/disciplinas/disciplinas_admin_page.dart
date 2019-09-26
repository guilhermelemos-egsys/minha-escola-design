import 'package:design/src/domain/model/disciplina.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/perfil/admin/disciplinas/dialog_adicionar_disciplina.dart';
import 'package:design/src/ui/perfil/admin/disciplinas/dialog_editar_disciplina.dart';
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:flutter/material.dart';

class DisciplinasAdminPage extends StatefulWidget {
  @override
  _DisciplinasAdminPageState createState() => _DisciplinasAdminPageState();
}

class _DisciplinasAdminPageState extends State<DisciplinasAdminPage> {
  Color currentColor = Colors.red;
  List<Disciplina> _disciplinas = [
    Disciplina(nome: "Português", nomeProfessor: "Daniela"),
    Disciplina(nome: "Matemática", nomeProfessor: "Fernanda"),
    Disciplina(nome: "Ciências", nomeProfessor: "Alexandra"),
    Disciplina(nome: "História", nomeProfessor: "Paula"),
    Disciplina(nome: "Geografia", nomeProfessor: "Márcio"),
    Disciplina(nome: "Redação", nomeProfessor: "Bianca"),
    Disciplina(nome: "Educação Física", nomeProfessor: "Samuel"),
    Disciplina(nome: "Inglês", nomeProfessor: "André"),
    Disciplina(nome: "Filosofia", nomeProfessor: "Airton"),
    Disciplina(nome: "Religião", nomeProfessor: "Roberto"),
    Disciplina(nome: "Artes", nomeProfessor: "Juliane")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disciplinas"),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              final result = dialogFactory.showDialog(
                context,
                MyDialog(
                  title: "Adicionar Disciplina",
                  content: DialogAdicionarDisciplina(),
                  funConfirmar: _adicionarDisciplina,
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
          count: _disciplinas.length,
          title: "Disciplinas Cadastradas",
        ),
        ..._disciplinas.map((disciplina) {
          return _buildItemDisciplina(disciplina);
        }).toList(),
      ]),
    );
  }

  Widget _buildItemDisciplina(Disciplina disciplina) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(
            disciplina.nome,
            style: Theme.of(context).textTheme.title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            disciplina.nomeProfessor,
            style: Theme.of(context).textTheme.subhead,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  dialogFactory.showDialog(
                    context,
                    MyDialog(
                      title: "Editar Disciplina",
                      content: DialogEditarDisciplina(disciplina: disciplina),
                      funConfirmar: _excluirDisciplina,
                    ),
                  );
                },
                icon: Icon(Icons.edit,
                    size: 16.0, color: theme.primaryIconButtonColor),
              ),
              IconButton(
                onPressed: () {
                  dialogFactory.showDialog(
                    context,
                    MyDialog(
                      title: "Excluir Disciplina",
                      content: _buildContentExcluirDisciplina(),
                      funConfirmar: _excluirDisciplina,
                      corBotaoConfirmar: Colors.red,
                    ),
                  );
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

  Widget _buildContentExcluirDisciplina() {
    return Text("Deseja realmente excluir esta disciplina?");
  }

  Function get _adicionarDisciplina => () {
        Navigator.pop(context);
      };

  Function get _editarDisciplina => () {
        Navigator.pop(context);
      };

  Function get _excluirDisciplina => () {
        Navigator.pop(context);
      };

  Function get _selecionarCor => () {
        Navigator.pop(context);
      };
}