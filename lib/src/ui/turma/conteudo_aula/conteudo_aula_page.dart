import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/perfil/admin/disciplinas/disciplinas_admin_page.dart';
import 'package:design/src/ui/turma/conteudo_aula/conteudo_page.dart';
import 'package:design/src/ui/turma/conteudo_aula/dialog_adicionar_conteudo.dart';
import 'package:design/src/ui/widgets/header_pages.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:flutter/material.dart';

class ConteudoAulaPage extends StatefulWidget {
  @override
  _ConteudoAulaPageState createState() => _ConteudoAulaPageState();
}

class _ConteudoAulaPageState extends State<ConteudoAulaPage> {
  List<Conteudo> _conteudos = [
    Conteudo(
        titulo: "Foto do Quadro",
        usuario: "Guilherme Lemos",
        disciplina: "Matemática",
        arquivos: [
          Arquivo(tag: "conteudo-1-imagem-1", icone: Icons.photo_library),
          Arquivo(tag: "conteudo-1-imagem-2", icone: Icons.photo_library),
          Arquivo(tag: "conteudo-1-pdf-1", icone: Icons.picture_as_pdf),
        ],
        data: "3 Setembro"),
    Conteudo(
        titulo: "Foto do Caderno da Luisa",
        usuario: "Marco Antônio",
        disciplina: "Portugues",
        arquivos: [
          Arquivo(tag: "conteudo-2-imagem-1", icone: Icons.photo_library),
          Arquivo(tag: "conteudo-2-pdf-1", icone: Icons.picture_as_pdf)
        ],
        data: "3 Setembro"),
    Conteudo(
        titulo: "Revisão da P1",
        usuario: "Maria da Silva",
        disciplina: "Ciências",
        arquivos: [
          Arquivo(tag: "conteudo-3-imagem-1", icone: Icons.photo_library)
        ],
        data: "27 Agosto"),
  ];

  List<Disciplina> _disciplinas = [
    Disciplina("Matematica", "Jose"),
    Disciplina("Portugues", "Jose"),
    Disciplina("Ciências", "Jose"),
    Disciplina("Geografia", "Jose"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conteúdo de Aula"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              dialogFactory.showDialog(
                context,
                MyDialog(
                  title: "Adicionar Conteudo",
                  content: DialogAdicionarConteudo(disciplinas: _disciplinas),
                  funConfirmar: _cadastrarConteudo,
                ),
              );
            },
            child: Text(
              "Adicionar",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(children: <Widget>[
        HeaderPage(
          title: "Conteúdo de aula compartilhado!",
          subtitle: "Clique sobre um conteúdo para ver seus detalhes...",
        ),
        ..._conteudos.map((conteudo) {
          return _buildItemConteudo(conteudo);
        }).toList(),
      ]),
    );
  }

  Widget _buildItemConteudo(Conteudo conteudo) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConteudoPage(conteudo: conteudo),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[100],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(conteudo.titulo,
                        style: Theme.of(context).textTheme.title),
                    SizedBox(height: 8.0),
                    Text("Postado por ${conteudo.usuario}",
                        style: Theme.of(context).textTheme.subhead),
                    SizedBox(height: 8.0),
                    Row(
                      children: <Widget>[
                        MyWrap(
                          conteudo: conteudo.disciplina,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: MyWrap(
                            conteudo: "${conteudo.arquivos.length} Arquivo(s)",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey[700],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Function get _cadastrarConteudo => () {
        Navigator.pop(context);
      };
}

class Conteudo {
  String titulo;
  String usuario;
  String disciplina;
  List<Arquivo> arquivos;
  String data;

  Conteudo(
      {this.titulo, this.usuario, this.disciplina, this.arquivos, this.data});
}

class Arquivo {
  String tag;
  IconData icone;

  Arquivo({this.tag, this.icone});
}
