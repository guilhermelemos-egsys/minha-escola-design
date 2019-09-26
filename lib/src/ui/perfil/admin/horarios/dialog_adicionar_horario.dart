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