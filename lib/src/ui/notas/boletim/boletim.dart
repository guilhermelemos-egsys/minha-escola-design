import 'package:design/src/ui/perfil/admin/avaliacoes/avaliacoes_admin_page.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:design/src/ui/widgets/my_expansion_tile.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';

class BoletimPage extends StatefulWidget {
  @override
  _BoletimPageState createState() => _BoletimPageState();
}

class _BoletimPageState extends State<BoletimPage> {
  List<Periodo> _periodos = [];

  List<Disciplina> _disciplinas = [];

  List<Avaliacao> _avaliacoes = [];

  @override
  void initState() {
    _avaliacoes = [
      Avaliacao(descricao: "Prova 1", nota: 7.8),
      Avaliacao(descricao: "Prova 2", nota: 7.2),
      Avaliacao(descricao: "Prova 3", nota: 8.1),
      Avaliacao(descricao: "Prova 4", nota: 9.4)
    ];

    _disciplinas = [
      Disciplina(nome: "Português", avaliacoes: _avaliacoes),
      Disciplina(nome: "Matemática", avaliacoes: _avaliacoes),
      Disciplina(nome: "Ciências", avaliacoes: _avaliacoes),
      Disciplina(nome: "História", avaliacoes: _avaliacoes),
      Disciplina(nome: "Geografia", avaliacoes: _avaliacoes)
    ];

    _periodos = [
      Periodo(descricao: "1º Trimestre", disciplinas: _disciplinas),
      Periodo(descricao: "2º Trimestre", disciplinas: _disciplinas),
      Periodo(descricao: "3º Trimestre", disciplinas: _disciplinas)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boletim"),
      ),
      body: DefaultTabController(
        length: _periodos.length,
        child: Builder(
          builder: (BuildContext context) => Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  children: _periodos.map((periodo) {
                    return _buildPeriodo(periodo);
                  }).toList(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(color: Colors.white),
                child: TabPageSelector(
                  selectedColor: Theme.of(context).primaryColor,
                  indicatorSize: 8.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodo(Periodo periodo) {
    return ListView(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 32.0),
            color: Colors.orange,
            child: Text(
              periodo.descricao,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        ...periodo.disciplinas.map((disciplina) {
          return _buildItemDisciplina(disciplina);
        }).toList(),
      ],
    );
  }

  Widget _buildItemDisciplina(Disciplina disciplina) {
    double media = 0;
    for(final avaliacao in disciplina.avaliacoes) {
      media += avaliacao.nota;
    }
    media = media/disciplina.avaliacoes.length;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: ListTile(
          title:
              Text(disciplina.nome, style: Theme.of(context).textTheme.title),
          trailing: MyWrap(
            conteudo: media.toString(),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
