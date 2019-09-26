import 'package:design/src/domain/model/avaliacao.dart';
import 'package:design/src/domain/model/disciplina.dart';
import 'package:design/src/domain/model/nota.dart';
import 'package:design/src/domain/model/periodo.dart';
import 'package:flutter/material.dart';

class DialogAdicionarAvaliacao extends StatefulWidget {
  @override
  _DialogAdicionarAvaliacaoState createState() => _DialogAdicionarAvaliacaoState();
}

class _DialogAdicionarAvaliacaoState extends State<DialogAdicionarAvaliacao> {
  List<Periodo> _periodos;
  String _periodoHint = "Selecione";
  Periodo _periodo;

  List<Disciplina> _disciplinas;
  String _disciplinaHint = "Selecione";
  Disciplina _disciplina;

  @override
  void initState() {
    _disciplinas = [
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

    _periodos = [
      Periodo(descricao: "1º Trimestre"),
      Periodo(descricao: "2º Trimestre"),
      Periodo(descricao: "3º Trimestre")
    ];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Descrição"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Periodo"),
              DropdownButton(
                value: _periodo,
                hint: Text(_periodoHint),
                onChanged: ((Periodo periodoSelecionado) {
                  setState(() {
                    _periodo = periodoSelecionado;
                    _periodoHint = _periodo.descricao;
                  });
                }),
                items: _periodos
                    .map(
                      (periodo) => DropdownMenuItem(
                        child: Text(periodo.descricao),
                        value: periodo,
                      ),
                    )
                    .toList(),
              ),
            ],
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
        ],
      ),
    );
  }
}