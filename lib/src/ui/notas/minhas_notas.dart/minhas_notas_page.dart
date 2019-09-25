import 'package:design/src/domain/model/avaliacao.dart';
import 'package:design/src/domain/model/disciplina.dart';
import 'package:design/src/domain/model/nota.dart';
import 'package:design/src/domain/model/periodo.dart';
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:design/src/ui/widgets/my_expansion_tile.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;

class MinhasNotasPage extends StatefulWidget {
  @override
  _MinhasNotasPageState createState() => _MinhasNotasPageState();
}

class _MinhasNotasPageState extends State<MinhasNotasPage> {
  List<Periodo> _periodos = [];

  List<Disciplina> _disciplinas = [];

  List<Avaliacao> _avaliacoesPortugues = [];
  List<Avaliacao> _avaliacoesMatematica = [];
  List<Avaliacao> _avaliacoesCiencias = [];
  List<Avaliacao> _avaliacoesHistoria = [];
  List<Avaliacao> _avaliacoesGeografia = [];

  Nota _nota1;
  Nota _nota2;
  Nota _nota3;
  Nota _nota4;
  Nota _nota5;
  Nota _nota6;
  Nota _nota7;
  Nota _nota8;
  Nota _nota9;
  Nota _nota10;
  Nota _nota11;
  Nota _nota12;

  @override
  void initState() {
    _nota1 = Nota(valor: 8.3);
    _nota2 = Nota(valor: 7.2);
    _nota3 = Nota(valor: 8.1);
    _nota4 = Nota(valor: 9.4);
    _nota5 = Nota(valor: 8.5);
    _nota6 = Nota(valor: 8.8);
    _nota7 = Nota(valor: 10);
    _nota8 = Nota(valor: 9.7);
    _nota9 = Nota(valor: 8.9);
    _nota10 = Nota(valor: 7.4);
    _nota11 = Nota(valor: 8);
    _nota12 = Nota(valor: 9.1);

    _avaliacoesPortugues = [
      Avaliacao(descricao: "Prova 1", nota: _nota8),
      Avaliacao(descricao: "Prova 2", nota: _nota5),
      Avaliacao(descricao: "Prova 3", nota: _nota12),
      Avaliacao(descricao: "Prova 4", nota: _nota1)
    ];

    _avaliacoesMatematica = [
      Avaliacao(descricao: "Prova 1", nota: _nota7),
      Avaliacao(descricao: "Prova 2"),
      Avaliacao(descricao: "Prova 3", nota: _nota7),
      Avaliacao(descricao: "Prova 4", nota: _nota7)
    ];

    _avaliacoesCiencias = [
      Avaliacao(descricao: "Prova 1", nota: _nota7),
      Avaliacao(descricao: "Prova 2", nota: _nota7),
      Avaliacao(descricao: "Prova 3", nota: _nota7),
      Avaliacao(descricao: "Prova 4"),
    ];

    _avaliacoesHistoria = [
      Avaliacao(descricao: "Prova 1", nota: _nota2),
      Avaliacao(descricao: "Prova 2", nota: _nota10),
      Avaliacao(descricao: "Prova 3", nota: _nota5),
      Avaliacao(descricao: "Prova 4", nota: _nota5)
    ];

    _avaliacoesGeografia = [
      Avaliacao(descricao: "Prova 1", nota: _nota5),
      Avaliacao(descricao: "Prova 2", nota: _nota6),
      Avaliacao(descricao: "Prova 3"),
      Avaliacao(descricao: "Prova 4")
    ];

    _disciplinas = [
      Disciplina(nome: "Português", avaliacoes: _avaliacoesPortugues),
      Disciplina(nome: "Matemática", avaliacoes: _avaliacoesMatematica),
      Disciplina(nome: "Ciências", avaliacoes: _avaliacoesCiencias),
      Disciplina(nome: "História", avaliacoes: _avaliacoesHistoria),
      Disciplina(nome: "Geografia", avaliacoes: _avaliacoesGeografia)
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
        title: Text("Minhas Notas"),
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
    NumberFormat numberFormat = NumberFormat("0.0");
    double media = 0;
    int cont = 0;
    bool semNota = false;
    for (var avaliacao in disciplina.avaliacoes) {
      if (avaliacao.nota != null) {
        media += avaliacao.nota.valor;
        cont++;
      } else {
        semNota = true;
      }
    }
    media = media / cont;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: MyExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(disciplina.nome,
                        style: Theme.of(context).textTheme.title),
                    SizedBox(width: 2.0),
                    semNota
                        ? Text("*",
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(color: Colors.red))
                        : Text("")
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text("Média"),
                    SizedBox(width: 4.0),
                    MyWrap(conteudo: numberFormat.format(media)),
                  ],
                ),
              ],
            ),
          ),
          children: <Widget>[
            Divider(height: 0.0),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ...disciplina.avaliacoes.map((avaliacao) {
                    return _buildItemAvaliacao(avaliacao);
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemAvaliacao(Avaliacao avaliacao) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(avaliacao.descricao, style: Theme.of(context).textTheme.subhead),
          avaliacao.nota != null
              ? Row(
                  children: <Widget>[
                    InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        _showDialogEditarNota(avaliacao);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.grey[700],
                          child: Icon(Icons.edit, size: 12.0),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        _showDialogExcluirNota();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          backgroundColor: Colors.grey[700],
                          child: Icon(Icons.delete, size: 12.0),
                        ),
                      ),
                    ),
                    MyWrap(conteudo: avaliacao.nota.valor.toString())
                  ],
                )
              : InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        _showDialogEditarNota(avaliacao);
                      },
                      child: MyWrap(conteudo: "Adicionar Nota", color: Colors.red)
                    ),
        ],
      ),
    );
  }

  void _showDialogAdicionarNota() {
    dialogFactory.showDialog(
      context,
      MyDialog(
        title: "Adicionar Nota",
        content: _buildContentAdicionarNota(),
        funConfirmar: _excluirNota,
      ),
    );
  }

  Widget _buildContentAdicionarNota() {
    return Form(
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: "Nota"),
      ),
    );
  }

  Function get _adicionarNota => () {
        Navigator.pop(context);
      };

  void _showDialogEditarNota(Avaliacao avaliacao) {
    dialogFactory.showDialog(
      context,
      MyDialog(
        title: "Editar Nota",
        content: _buildContentEditarNota(avaliacao),
        funConfirmar: _editarNota,
      ),
    );
  }

  Widget _buildContentEditarNota(Avaliacao avaliacao) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextFormField(
            initialValue: avaliacao.nota.valor.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Nota"),
          ),
        ],
      ),
    );
  }

  Function get _editarNota => () {
        Navigator.pop(context);
      };

  void _showDialogExcluirNota() {
    dialogFactory.showDialog(
      context,
      MyDialog(
        title: "Excluir Nota",
        content: Text("Deseja realmente excluir esta nota?"),
        funConfirmar: _excluirNota,
        corBotaoConfirmar: Colors.red,
      ),
    );
  }

  Function get _excluirNota => () {
        Navigator.pop(context);
      };
}
