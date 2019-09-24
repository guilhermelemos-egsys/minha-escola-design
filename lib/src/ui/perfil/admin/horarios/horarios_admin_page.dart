import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/perfil/admin/disciplinas/disciplinas_admin_page.dart';
import 'package:design/src/ui/turma/horarios/horarios.dart';
import 'package:flutter/material.dart';
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;

class HorariosAdminPage extends StatefulWidget {
  @override
  _HorariosAdminPageState createState() => _HorariosAdminPageState();
}

class _HorariosAdminPageState extends State<HorariosAdminPage> {
  List<Horario> _horarios = new List(25);

  List<Horario> _horariosListados = [];

  String _disciplinaHint = "Disciplina";

  Disciplina _disciplina;

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
        title: Text("Horários"),
      ),
      body: _buildHorarios(),
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
      child: InkWell(
        onTap: () async {
          final result = await dialogFactory.showDialog(
            context,
            MyDialog(
              title: "Adicionar Horário",
              content: _buildContentAdicionarHorario(),
              funConfirmar: _adicionarHorario,
            ),
          );
          print(result);
        },
        child: Center(
          child: Text(
            horario == null
                ? "Vazio"
                : horario.disciplina.substring(0, 4).toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildContentAdicionarHorario() {
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

  Function get _adicionarHorario => () {
        Navigator.pop(context);
      };
}