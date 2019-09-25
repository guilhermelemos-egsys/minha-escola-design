import 'package:design/src/domain/model/disciplina.dart';
import 'package:flutter/material.dart';

class DialogAdicionarHorario extends StatefulWidget {
  @override
  _DialogAdicionarHorarioState createState() => _DialogAdicionarHorarioState();
}

class _DialogAdicionarHorarioState extends State<DialogAdicionarHorario> {
  String _disciplinaHint = "Disciplina";

  Disciplina _disciplina;

  List<Disciplina> _disciplinas = [
    Disciplina(nome: "Português", nomeProfessor: ""),
    Disciplina(nome: "Matemática", nomeProfessor: ""),
    Disciplina(nome: "Ciências", nomeProfessor: ""),
    Disciplina(nome: "História", nomeProfessor: ""),
    Disciplina(nome: "Geografia", nomeProfessor: ""),
  ];
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Disciplina"),
      trailing: DropdownButton(
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
    );
  }
}