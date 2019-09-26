import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:flutter/material.dart';

class HorariosPage extends StatefulWidget {
  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  List<Horario> _horarios = new List(30);

  static int _verde = 0xff4caf50;
  static int _laranja = 0xffff5043;
  static int _azulFraco = 0xff4dd0e1;
  static int _marrom = 0xff795548;
  static int _roxo = 0xff8e24aa;
  static int _amarelo = 0xffffeb3b;
  static int _preto = 0xff424242;
  static int _azulForte = 0xff0d47a1;
  static int _vermelho = 0xffc62828;
  static int _rosa = 0xffe040fb;
  static int _verdeAgua = 0xff64ffda;

  List<Horario> _horariosListados = [
    Horario(disciplina: "Geografia", cor: _azulFraco, index: 0),
    Horario(disciplina: "Ciências", cor: _verde, index: 1),
    Horario(disciplina: "Ed.Física", cor: _vermelho, index: 2),
    Horario(disciplina: "Ciências", cor: _verde, index: 3),
    Horario(disciplina: "Redação", cor: _preto, index: 4),
    Horario(disciplina: "Filosofia", cor: _azulForte, index: 5),
    Horario(disciplina: "Português", cor: _laranja, index: 6),
    Horario(disciplina: "Ed.Física", cor: _vermelho, index: 7),
    Horario(disciplina: "Ciências", cor: _verde, index: 8),
    Horario(disciplina: "Artes", cor: _verdeAgua, index: 9),
    Horario(disciplina: "História", cor: _rosa, index: 10),
    Horario(disciplina: "Português", cor: _laranja, index: 11),
    Horario(disciplina: "Inglês", cor: _roxo, index: 12),
    Horario(disciplina: "Geografia", cor: _azulFraco, index: 13),
    Horario(disciplina: "Inglês", cor: _roxo, index: 14),
    Horario(disciplina: "História", cor: _rosa, index: 15),
    Horario(disciplina: "Matemática", cor: _amarelo, index: 16),
    Horario(disciplina: "Inglês", cor: _roxo, index: 17),
    Horario(disciplina: "Matemática", cor: _amarelo, index: 18),
    Horario(disciplina: "Inglês", cor: _roxo, index: 19),
    Horario(disciplina: "Matemática", cor: _amarelo, index: 20),
    Horario(disciplina: "Religião", cor: _marrom, index: 21),
    Horario(disciplina: "Redação", cor: _preto, index: 22),
    Horario(disciplina: "Português", cor: _laranja, index: 23),
    Horario(disciplina: "Matemática", cor: _amarelo, index: 24),
    Horario(disciplina: "Matemática", cor: _amarelo, index: 25),
    Horario(disciplina: "Religião", cor: _marrom, index: 26),
    Horario(disciplina: "Português", cor: _laranja, index: 27),
    Horario(disciplina: "Inglês", cor: _roxo, index: 28),
    Horario(disciplina: "Matemática", cor: _amarelo, index: 29),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horários"),
      ),
      body: ListView(
        children: <Widget>[_buildHorarios()],
      ),
    );
  }

  Widget _buildHorarios() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeaderHorarios(),
          SizedBox(height: 8.0),
          _buildGridHorarios()
        ],
      ),
    );
  }

  Widget _buildHeaderHorarios() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _buildDiaSemana("Seg"),
        _buildDiaSemana("Ter"),
        _buildDiaSemana("Qua"),
        _buildDiaSemana("Qui"),
        _buildDiaSemana("Sex")
      ],
    );
  }

  Widget _buildDiaSemana(String dia) {
    return Text(dia, style: Theme.of(context).textTheme.title);
  }

  Widget _buildGridHorarios() {
    for (final horario in _horariosListados) {
      _horarios[horario.index] = horario;
    }
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 5,
      children: _horarios.map((horario) {
        return _buildItemHorario(horario);
      }).toList(),
    );
  }

  Widget _buildItemHorario(Horario horario) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      color: horario == null ? Colors.grey : Color(horario.cor),
      child: Center(
        child: Text(
          horario == null
              ? "Vazio"
              : horario.disciplina.substring(0, 4).toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class Horario {
  String disciplina;
  int cor;
  int index;

  Horario({this.disciplina, this.cor, this.index});
}
