import 'package:design/src/domain/model/avaliacao.dart';
import 'package:design/src/domain/model/disciplina.dart';
import 'package:design/src/domain/model/nota.dart';
import 'package:design/src/domain/model/periodo.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:design/src/ui/widgets/header_pages.dart';
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

  Nota _nota1;
  Nota _nota2;
  Nota _nota3;
  Nota _nota4;

  @override
  void initState() {
    _nota1 = Nota(valor: 7.8);
    _nota2 = Nota(valor: 7.2);
    _nota3 = Nota(valor: 8.1);
    _nota4 = Nota(valor: 9.4);

    _avaliacoes = [
      Avaliacao(descricao: "Prova 1", nota: _nota1),
      Avaliacao(descricao: "Prova 2", nota: _nota2),
      Avaliacao(descricao: "Prova 3", nota: _nota3),
      Avaliacao(descricao: "Prova 4", nota: _nota4)
    ];

    _disciplinas = [
      Disciplina(nome: "Português", nomeProfessor: "Daniela", avaliacoes: _avaliacoes),
    Disciplina(nome: "Matemática", nomeProfessor: "Fernanda", avaliacoes: _avaliacoes),
    Disciplina(nome: "Ciências", nomeProfessor: "Alexandra", avaliacoes: _avaliacoes),
    Disciplina(nome: "História", nomeProfessor: "Paula", avaliacoes: _avaliacoes),
    Disciplina(nome: "Geografia", nomeProfessor: "Márcio", avaliacoes: _avaliacoes),
    Disciplina(nome: "Redação", nomeProfessor: "Bianca", avaliacoes: _avaliacoes),
    Disciplina(nome: "Educação Física", nomeProfessor: "Samuel", avaliacoes: _avaliacoes),
    Disciplina(nome: "Inglês", nomeProfessor: "André", avaliacoes: _avaliacoes),
    Disciplina(nome: "Filosofia", nomeProfessor: "Airton", avaliacoes: _avaliacoes),
    Disciplina(nome: "Religião", nomeProfessor: "Roberto", avaliacoes: _avaliacoes),
    Disciplina(nome: "Artes", nomeProfessor: "Juliane", avaliacoes: _avaliacoes)
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
      body: ListView(
        children: <Widget>[
          HeaderPage(
            title: "Seu Boletim!",
            subtitle: "Veja suas médias em cada disciplina por trimestre...",
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
                  MyWrap(conteudo: "8.9")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "8.6")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "7.9")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "8.8")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "9.7")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "8.9")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "8.6")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "7.9")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "10")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "8.8")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "9.7")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
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
                  MyWrap(conteudo: "8.8")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("2º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "9.7")
                ],
              ),
              SizedBox(width: 16.0),
              Column(
                children: <Widget>[
                  Text("3º Trim.", style: Theme.of(context).textTheme.body2),
                  SizedBox(height: 4.0),
                  MyWrap(conteudo: "-")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
