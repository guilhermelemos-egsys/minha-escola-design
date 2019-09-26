import 'package:design/src/domain/model/aviso.dart';
import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:design/src/ui/widgets/my_expansion_tile.dart';
import 'package:flutter/material.dart';

class AvisosPage extends StatefulWidget {
  @override
  _AvisosPageState createState() => _AvisosPageState();
}

class _AvisosPageState extends State<AvisosPage> {
  List<Aviso> _avisos = [
    Aviso(
        usuario: "Maria Fernanda Lima",
        titulo: "Prova de Matemática",
        conteudo: "Teremos prova de Matemática dia 07/10.",
        data: "26 de setembro"),
    Aviso(
        usuario: "Maria Fernanda Lima",
        titulo: "Prova de Geografia",
        conteudo:
            "Teremos prova de Geografia dia 10/10, sobre o conteúdo Região Sul e Região Nordeste.",
        data: "26 de setembro"),
    Aviso(
        usuario: "Maria Fernanda Lima",
        titulo: "EXPOCOL",
        conteudo:
            "A EXPOCOL inicia às 08:30 e termina às 12:30.",
        data: "26 de setembro"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avisos"),
      ),
      body: ListView(
        children: <Widget>[
          HeaderPage(
            title: "Estes são os avisos da sua turma!",
            subtitle: "Clique sobre um aviso para ver seus detalhes...",
          ),
          ..._avisos.map((aviso) {
            return _buildItemAviso(aviso);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildItemAviso(Aviso aviso) {
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
                Text(aviso.titulo, style: Theme.of(context).textTheme.title),
                SizedBox(height: 4.0),
                Text("Postado por ${aviso.usuario}"),
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
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          child: Icon(Icons.person_outline),
                        ),
                      ),
                      Text(
                        aviso.usuario,
                        style: Theme.of(context).textTheme.title,
                      )
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    aviso.titulo,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    aviso.conteudo,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  SizedBox(height: 16.0),
                  Text("Postado em ${aviso.data}",
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.grey[700]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
