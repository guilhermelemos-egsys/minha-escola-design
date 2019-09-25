import 'package:design/src/domain/model/disciplina.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class DialogAdicionarDisciplina extends StatefulWidget {
  @override
  _DialogAdicionarDisciplinaState createState() =>
      _DialogAdicionarDisciplinaState();
}

class _DialogAdicionarDisciplinaState extends State<DialogAdicionarDisciplina> {
  Color currentColor;

  List<Disciplina> _disciplinas = [
    Disciplina(nome: "Português", nomeProfessor: "José"),
    Disciplina(nome: "Matemática", nomeProfessor: "Maria"),
    Disciplina(nome: "Ciências", nomeProfessor: "Camila"),
    Disciplina(nome: "História", nomeProfessor: "Marcos"),
    Disciplina(nome: "Geografia", nomeProfessor: "Alice"),
  ];

  @override
  Widget build(BuildContext context) {
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
              currentColor == null
                  ? Text("Cor da Disciplina")
                  : CircleAvatar(
                      radius: 16.0,
                      backgroundColor: currentColor,
                    ),
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

  Function get _selecionarCor => () {
        Navigator.pop(context);
      };
}
