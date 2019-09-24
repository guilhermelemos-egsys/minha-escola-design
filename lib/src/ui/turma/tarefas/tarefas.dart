import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';

class TarefasPage extends StatefulWidget {
  @override
  _TarefasPageState createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  List<Tarefa> _tarefas = [
    Tarefa(
        descricao: "Prova G1",
        disciplina: "Português",
        tipoTarefa: "Prova",
        data: "6 Setembro"),
    Tarefa(
        descricao: "Trigonometria",
        disciplina: "Matemática",
        tipoTarefa: "Trabalho",
        data: "6 Maio"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
      ),
      body: ListView(
        children: <Widget> [
          HeaderPage(title: "Suas tarefas estão aqui!", subtitle: "Clique sobre uma tarefa para ver seus detalhes...",),
          ..._tarefas.map((tarefa) {
          return _buildItemTarefa(tarefa);
        }).toList(),
        ]
      ),
    );
  }

  Widget _buildItemTarefa(Tarefa tarefa) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0), color: Colors.grey[100]),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(tarefa.descricao, style: Theme.of(context).textTheme.title),
              SizedBox(height: 8.0),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      MyWrap(conteudo: tarefa.disciplina),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: MyWrap(conteudo: tarefa.tipoTarefa),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Entrega em",
                        style: Theme.of(context).textTheme.subhead),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: MyWrap(
                          conteudo: tarefa.data,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tarefa {
  String descricao;
  String disciplina;
  String tipoTarefa;
  String data;

  Tarefa({this.descricao, this.disciplina, this.tipoTarefa, this.data});
}
