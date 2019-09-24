import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class DisciplinasAdminPage extends StatefulWidget {
  @override
  _DisciplinasAdminPageState createState() => _DisciplinasAdminPageState();
}

class _DisciplinasAdminPageState extends State<DisciplinasAdminPage> {
  Color currentColor = Colors.red;
  List<Disciplina> _disciplinas = [
    Disciplina("Matemática", "José da Silva"),
    Disciplina("Português", "Maria da Silva"),
    Disciplina("Geografia", "Camila da Silva"),
    Disciplina("Ciências", "André da Silva")
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
                  content: _buildContentAdicionarDisciplina(),
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
                      content: _buildContentEditarDisciplina(disciplina),
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

  Widget _buildContentAdicionarDisciplina() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Disciplina"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Professor"),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Cor da Disciplina"),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: theme.primaryColor,
                onPressed: () {
                  _buildColorPicker(context);
                },
                child: Text(
                  "Selecionar Cor",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: theme.secondaryTextColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContentEditarDisciplina(Disciplina disciplina) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            initialValue: disciplina.nome,
            decoration: InputDecoration(labelText: "Disciplina"),
          ),
          TextFormField(
            initialValue: disciplina.nomeProfessor,
            decoration: InputDecoration(labelText: "Professor"),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Cor da Disciplina"),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: theme.primaryColor,
                onPressed: () {
                  _buildColorPicker(context);
                },
                child: Text(
                  "Selecionar Cor",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: theme.secondaryTextColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContentExcluirDisciplina() {
    return Text("Deseja realmente excluir esta disciplina?");
  }

  void _buildColorPicker(BuildContext context) async {
    return showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              title: Text(
                "Selecione uma cor",
                style: Theme.of(context).textTheme.title,
              ),
              actions: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: theme.primaryColor,
                  child: Text(
                    "Cancelar",
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: theme.secondaryTextColor),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: const EdgeInsets.all(8.0),
                  onPressed: _selecionarCor,
                  color: theme.secondaryColor,
                  child: Text(
                    "Confirmar",
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: theme.secondaryTextColor),
                  ),
                ),
              ],
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              ),
              contentPadding: const EdgeInsets.all(0.0),
              content: _buildContentColorPicker(),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {},
    );
  }

  Widget _buildContentColorPicker() {
    return MaterialColorPicker(
      onColorChange: (value) {
        setState(() {
          currentColor = value;
        });
      },
      colors: [
        Colors.red,
        Colors.deepOrange,
        Colors.yellow,
        Colors.lightGreen,
        Colors.blue,
        Colors.amber,
        Colors.green,
        Colors.pink,
      ],
    );
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

class Disciplina {
  String nome;
  String nomeProfessor;

  Disciplina(this.nome, this.nomeProfessor);
}
