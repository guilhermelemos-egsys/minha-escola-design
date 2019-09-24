import 'package:design/src/ui/adicionar_turma/criar_turma_page.dart';
import 'package:design/src/ui/adicionar_turma/entrar_turma_page.dart';
import 'package:flutter/material.dart';

class AdicionarTurmaPage extends StatefulWidget {
  @override
  _AdicionarTurmaPageState createState() => _AdicionarTurmaPageState();
}

class _AdicionarTurmaPageState extends State<AdicionarTurmaPage> {
  final _pages = <Widget>[CriarTurmaPage(), EntrarTurmaPage()];

  final _kTabs = <Tab>[
    Tab(text: "Criar"),
    Tab(text: "Entrar")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Adicionar Turma"),
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _pages,
        ),
      ),
    );
  }
}