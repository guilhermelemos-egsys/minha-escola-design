import 'package:design/src/domain/model/item_lista_menu.dart';
import 'package:design/src/ui/notas/boletim/boletim.dart';
import 'package:design/src/ui/notas/minhas_notas.dart/minhas_notas_page.dart';
import 'package:design/src/ui/notas/quadro_de_medalhas/quadro_de_medalhas_page.dart';
import 'package:flutter/material.dart';

class NotasPage extends StatefulWidget {
  @override
  _NotasPageState createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  List<ItemListaMenu> _itensMenu = [];

  @override
  void initState() {
    _itensMenu = [
      ItemListaMenu(
          icone: Icons.insert_chart,
          titulo: "Minhas Notas",
          onclick: _moveToMinhasNotas),
      ItemListaMenu(
          icone: Icons.note, titulo: "Boletim", onclick: _moveToBoletim),
      ItemListaMenu(icone: Icons.grade, titulo: "Quadro de Medalhas", onclick: _moveToQuadroDeMedalhas)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notas"),
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

  Function get _moveToMinhasNotas => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MinhasNotasPage()),
        );
      };

  Function get _moveToBoletim => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BoletimPage()),
        );
      };

  Function get _moveToQuadroDeMedalhas => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuadroDeMedalhasPage()),
        );
      };
}
