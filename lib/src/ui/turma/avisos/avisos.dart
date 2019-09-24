import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:design/src/ui/widgets/my_expansion_tile.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';

class AvisosPage extends StatefulWidget {
  @override
  _AvisosPageState createState() => _AvisosPageState();
}

class _AvisosPageState extends State<AvisosPage> {
  List<Aviso> _avisos = [
    Aviso(
        "Guilherme Lemos",
        "Prova de Matemática",
        "Teremos prova de matemática dia 13/09 valendo "
        "4 pontos. A prova será sobre o conteúdo tal.",
        "3 Setembro"),
    Aviso(
        "Guilherme Lemos",
        "Trabalho de História",
        "Teremos um trabalho de história valendo 2 pontos. Será em grupo, cada grupo "
        "terá no máximo 4 integrantes. A entrega é dia 23/09",
        "3 Setembro"),
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
                Row(
                  children: <Widget>[
                    Text("Postado por ${aviso.usuario}, em",
                        style: Theme.of(context).textTheme.subhead),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: MyWrap(
                        conteudo: aviso.data,
                        color: Colors.grey,
                      ),
                    ),
                  ],
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

class Aviso {
  String usuario;
  String titulo;
  String conteudo;
  String data;

  Aviso(this.usuario, this.titulo, this.conteudo, this.data);
}
