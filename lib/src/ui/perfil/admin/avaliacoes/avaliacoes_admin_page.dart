import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:design/src/ui/widgets/my_expansion_tile.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';

class AvaliacoesAdminPage extends StatefulWidget {
  @override
  _AvaliacoesAdminPageState createState() => _AvaliacoesAdminPageState();
}

class _AvaliacoesAdminPageState extends State<AvaliacoesAdminPage> {
  List<Periodo> _periodos;
  String _periodoHint = "Selecione";
  Periodo _periodo;

  List<Disciplina> _disciplinas;
  String _disciplinaHint = "Selecione";
  Disciplina _disciplina;

  List<Avaliacao> _avaliacoes;
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
      Periodo(descricao: "1º Bimestre", disciplinas: _disciplinas),
      Periodo(descricao: "2º Bimestre", disciplinas: _disciplinas),
      Periodo(descricao: "3º Bimestre", disciplinas: _disciplinas)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avaliações"),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              final result = dialogFactory.showDialog(
                context,
                MyDialog(
                  title: "Adicionar Avaliação",
                  content: _buildContentAdicionarAvaliacao(),
                  funConfirmar: _adicionarAvaliacao,
                ),
              );
              print(result);
            },
            child: Text(
              "Adicionar",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: theme.secondaryTextColor),
            ),
          )
        ],
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
                Text(disciplina.nome, style: Theme.of(context).textTheme.title),
                SizedBox(height: 4.0),
                MyWrap(
                  conteudo: "${disciplina.avaliacoes.length} Avaliações",
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          children: <Widget>[
            Divider(height: 0.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(avaliacao.descricao, style: Theme.of(context).textTheme.subhead),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () async {
                final result = dialogFactory.showDialog(
                  context,
                  MyDialog(
                    title: "Editar Avaliação",
                    content: _buildContentEditarAvaliacao(avaliacao),
                    funConfirmar: _editarAvaliacao,
                  ),
                );
                print(result);
              },
              icon: Icon(Icons.edit, size: 16.0, color: Colors.grey[700]),
            ),
            IconButton(
              onPressed: () async {
                final result = dialogFactory.showDialog(
                  context,
                  MyDialog(
                    title: "Excluir Avaliação",
                    content: _buildContentExcluirAvaliacao(),
                    funConfirmar: _excluirAvaliacao,
                    corBotaoConfirmar: Colors.red,
                  ),
                );
                print(result);
              },
              icon: Icon(Icons.delete, size: 16.0, color: Colors.grey[700]),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildContentAdicionarAvaliacao() {
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

  Widget _buildContentEditarAvaliacao(Avaliacao avaliacao) {
    return Form(
      child: TextFormField(
        initialValue: avaliacao.descricao,
        decoration: InputDecoration(labelText: "Descricao"),
      ),
    );
  }

  Widget _buildContentExcluirAvaliacao() {
    return Text("Deseja realmente excluir esta avaliação?");
  }

  Function get _adicionarAvaliacao => () {
        Navigator.pop(context);
      };

  Function get _editarAvaliacao => () {
        Navigator.pop(context);
      };

  Function get _excluirAvaliacao => () {
        Navigator.pop(context);
      };
}

class Periodo {
  String descricao;
  DateTime dataInicio;
  DateTime dataFim;
  List<Disciplina> disciplinas;

  Periodo({this.descricao, this.dataInicio, this.dataFim, this.disciplinas});
}

class Disciplina {
  String nome;
  List<Avaliacao> avaliacoes;

  Disciplina({this.nome, this.avaliacoes});
}

class Avaliacao {
  String descricao;
  double nota;

  Avaliacao({this.descricao, this.nota});
}
