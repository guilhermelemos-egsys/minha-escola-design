import 'package:design/src/domain/model/item_lista_menu.dart';
import 'package:design/src/ui/turma/avisos/avisos.dart';
import 'package:design/src/ui/turma/conteudo_aula/conteudo_aula_page.dart';
import 'package:design/src/ui/turma/horarios/horarios.dart';
import 'package:design/src/ui/turma/tarefas/tarefas.dart';
import 'package:design/src/ui/turma/usuarios/usuarios_page.dart';
import 'package:flutter/material.dart';

class TurmaPage extends StatefulWidget {
  @override
  _TurmaPageState createState() => _TurmaPageState();
}

class _TurmaPageState extends State<TurmaPage> {
  List<ItemListaMenu> _itensMenu = [];

  @override
  void initState() {
    _itensMenu = [
      ItemListaMenu(
          icone: Icons.access_time,
          titulo: "Horários",
          onclick: _moveToHorarios),
      ItemListaMenu(
          icone: Icons.assignment, titulo: "Tarefas", onclick: _moveToTarefas),
      ItemListaMenu(
          icone: Icons.speaker_notes,
          titulo: "Avisos Gerais",
          onclick: _moveToAvisos),
      ItemListaMenu(
          icone: Icons.slideshow,
          titulo: "Conteúdo de Aula",
          onclick: _moveToConteudoDeAula),
      ItemListaMenu(
          icone: Icons.group, titulo: "Usuários", onclick: _moveToUsuarios)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha Turma"),
        ),
        body: ListView(
          children: _itensMenu.map((item) {
            return _buildItemLista(item);
          }).toList(),
        ));
  }

  Widget _buildItemLista(ItemListaMenu item) {
    return ListTile(
      onTap: item.onclick,
      leading: Icon(item.icone),
      title: Text(item.titulo),
    );
  }

  Function get _moveToHorarios => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HorariosPage()),
        );
      };

  Function get _moveToTarefas => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TarefasPage()),
        );
      };

  Function get _moveToAvisos => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AvisosPage()),
        );
      };

  Function get _moveToConteudoDeAula => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConteudoAulaPage()),
        );
      };

  Function get _moveToUsuarios => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UsuariosPage()),
        );
      };
}
