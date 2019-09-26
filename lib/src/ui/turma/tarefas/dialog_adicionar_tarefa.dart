import 'package:design/src/domain/model/disciplina.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class DialogAdicionarTarefa extends StatefulWidget {
  @override
  _DialogAdicionarTarefaState createState() => _DialogAdicionarTarefaState();
}

class _DialogAdicionarTarefaState extends State<DialogAdicionarTarefa> {
  String _disciplinaHint = "Disciplina";

  Disciplina _disciplina;

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

  String data;

  Future _selectDate() async {
    initializeDateFormatting("pt_BR", null);
    final format = DateFormat.MMMMd("pt_BR");
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2020));
    if (picked != null) {
      setState(() {
        data = format.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: theme.primaryColor,
                onPressed: () {
                  _selectDate();
                },
                child: Text(
                  "Selecionar Data",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: theme.secondaryTextColor),
                ),
              ),
              Text(data == null ? "Nenhuma data selecionada" : data),
            ],
          ),
        ],
      ),
    );
  }
}
