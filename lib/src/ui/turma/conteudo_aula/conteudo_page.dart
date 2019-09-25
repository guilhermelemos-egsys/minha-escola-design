import 'package:design/src/domain/model/arquivo.dart';
import 'package:design/src/domain/model/conteudo.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';

class ConteudoPage extends StatefulWidget {
  Conteudo conteudo;

  ConteudoPage({this.conteudo});

  @override
  _ConteudoPageState createState() => _ConteudoPageState();
}

class _ConteudoPageState extends State<ConteudoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conteúdo de Aula"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildHeaderConteudo(),
          Divider(height: 32.0),
          Text(
            widget.conteudo.titulo,
            style: Theme.of(context).textTheme.headline,
          ),
          SizedBox(height: 4.0),
          Text(
            "Postado em ${widget.conteudo.data}",
            style: Theme.of(context).textTheme.subhead.copyWith(
                  color: Colors.grey[700],
                ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              MyWrap(conteudo: widget.conteudo.disciplina),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "${widget.conteudo.arquivos.length} Arquivo(s)",
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: widget.conteudo.arquivos.map((arquivo){
              return _buildItemArquivo(context, arquivo);
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderConteudo() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 24.0,
          child: Icon(
            Icons.person_outline,
            size: 20.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.conteudo.usuario,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ],
    );
  }

  Widget _buildItemArquivo(BuildContext context, Arquivo arquivo) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Hero(
          tag: arquivo.tag,
          child: CircleAvatar(
            radius: 20.0,
            child: Icon(arquivo.icone),
          ),
        ),
        onTap: () => _showArquivo(context, arquivo),
      ),
    );
  }

  void _showArquivo(BuildContext context, Arquivo arquivo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            title: Text("Voltar"),
          ),
          body: Center(
            child: Hero(
              tag: arquivo.tag,
              child: Icon(
                arquivo.icone,
                size: 200.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
