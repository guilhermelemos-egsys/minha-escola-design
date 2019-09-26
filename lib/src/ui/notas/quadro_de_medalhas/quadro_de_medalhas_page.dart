import 'package:design/src/domain/model/avaliacao.dart';
import 'package:design/src/domain/model/disciplina.dart';
import 'package:design/src/domain/model/periodo.dart';
import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:flutter/material.dart';

class QuadroDeMedalhas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[QuadroDeMedalhasPage()],
      ),
    );
  }
}

class QuadroDeMedalhasPage extends StatefulWidget {
  @override
  _QuadroDeMedalhasPageState createState() => _QuadroDeMedalhasPageState();
}

class _QuadroDeMedalhasPageState extends State<QuadroDeMedalhasPage> {
  List<Periodo> _periodos = [];

  List<Disciplina> _disciplinas = [];

  List<Avaliacao> _avaliacoes = [];


  @override
  void initState() {
    _avaliacoes = [
      Avaliacao(descricao: "Prova 1"),
      Avaliacao(descricao: "Prova 2"),
      Avaliacao(descricao: "Prova 3"),
      Avaliacao(descricao: "Prova 4")
    ];

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
        title: Text("Quadro de Medalhas"),
      ),
      body: ListView(
        children: <Widget>[
          HeaderPage(
            title: "Seu Quadro de Medalhas!",
            subtitle: "Veja seu desempenho em cada trimestre...",
          ),
          _buildItemDisciplinaPortugues(),
          _buildItemDisciplinaMatematica(),
          _buildItemDisciplinaCiencias(),
          _buildItemDisciplinaHistoria(),
          _buildItemDisciplinaGeografia(),
          _buildItemDisciplinaRedacao(),
          _buildItemDisciplinaEducacaoFisica(),
          _buildItemDisciplinaIngles(),
          _buildItemDisciplinaFilosofia(),
          _buildItemDisciplinaReligiao(),
          _buildItemDisciplinaArtes()
        ],
      ),
    );
  }

  Widget _buildItemDisciplinaPortugues() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Português",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaMatematica() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Matemática",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaCiencias() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Ciências",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaHistoria() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "História",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/bronze.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaGeografia() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Geografia",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaRedacao() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Redação",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaEducacaoFisica() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Educação Física",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaIngles() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Inglês",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaFilosofia() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Filosofia",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/bronze.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/ouro.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaReligiao() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Religião",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemDisciplinaArtes() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Text(
                "Artes",
                style: Theme.of(context).textTheme.title,
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text("1º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Image.asset('images/prata.png', height: 32.0)
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  Container(
                    alignment: Alignment.center,
                    height: 32.0,
                    child: Text("-"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
