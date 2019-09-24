import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:flutter/material.dart';

class HorariosPage extends StatefulWidget {
  @override
  _HorariosPageState createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  List<Horario> _horarios = new List(30);

  List<Horario> _horariosListados = [
    Horario(disciplina: "Português", cor: 0xff702525, index: 0),
    Horario(disciplina: "Português", cor: 0xff702525, index: 5),
    Horario(disciplina: "Português", cor: 0xff702525, index: 7),
    Horario(disciplina: "Português", cor: 0xff702525, index: 13),
    Horario(disciplina: "Português", cor: 0xff702525, index: 16),
    Horario(disciplina: "Português", cor: 0xff702525, index: 24),
    Horario(disciplina: "Matemática", cor: 0xfffa7c2d, index: 6),
    Horario(disciplina: "Matemática", cor: 0xfffa7c2d, index: 9),
    Horario(disciplina: "Matemática", cor: 0xfffa7c2d, index: 14),
    Horario(disciplina: "Matemática", cor: 0xfffa7c2d, index: 18),
    Horario(disciplina: "Matemática", cor: 0xfffa7c2d, index: 23),
    Horario(disciplina: "Ciências", cor: 0xff361a09, index: 3),
    Horario(disciplina: "Ciências", cor: 0xff361a09, index: 8),
    Horario(disciplina: "Ciências", cor: 0xff361a09, index: 20),
    Horario(disciplina: "Geografia", cor: 0xff008f79, index: 17),
    Horario(disciplina: "Geografia", cor: 0xff008f79, index: 22),
    Horario(disciplina: "Historia", cor: 0xff02a5f0, index: 19),
    Horario(disciplina: "Historia", cor: 0xff02a5f0, index: 21),
    Horario(disciplina: "Efis", cor: 0xffb54800, index: 1),
    Horario(disciplina: "Efis", cor: 0xffb54800, index: 4),
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
