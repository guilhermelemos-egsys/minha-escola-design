import 'package:design/src/domain/model/comentario.dart';
import 'package:design/src/domain/model/post.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/forum/dialog_adicionar_postagem.dart';
import 'package:design/src/ui/widgets/my_expansion_tile.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  List<Post> _posts = [];

  @override
  void initState() {
    _posts = [
      Post(
          titulo: "P1 de História",
          conteudo:
              "Gente, alguém sabe qual o conteúdo da P1 de História e que dia vai ser?",
          usuario: "Juliana",
          dataPostagem: DateTime.now(),
          comentarios: [
            Comentario(conteudo: "...", usuario: "Maria Fernanda"),
            Comentario(conteudo: "...", usuario: "Nathalie"),
            Comentario(conteudo: "...", usuario: "Mariana")
          ])
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fórum"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _showDialog(context);
            },
            child: Text(
              "Adicionar Postagem",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: theme.secondaryTextColor),
            ),
          )
        ],
      ),
      body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: _posts.map((post) {
            return _buildItemPost(post);
          }).toList()),
    );
  }

  Widget _buildItemPost(Post post) {
    initializeDateFormatting("pt_BR", null);
    final format = DateFormat.MMMMd("pt_BR");
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.grey[100]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      child: Icon(Icons.person_outline),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        post.usuario,
                        style: Theme.of(context).textTheme.title,
                      ),
                    )
                  ],
                ),
                MyWrap(
                  conteudo: format.format(post.dataPostagem),
                  color: Colors.grey,
                )
              ],
            ),
            SizedBox(height: 8.0),
            Text(post.titulo, style: Theme.of(context).textTheme.subtitle),
            SizedBox(height: 4.0),
            Text(post.conteudo),
            MyExpansionTile(
              title: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "Comentários",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ),
                  CircleAvatar(
                    radius: 8.0,
                    backgroundColor: theme.secondaryColor,
                    child: Text(
                      post.comentarios.length.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .copyWith(color: theme.secondaryTextColor),
                    ),
                  )
                ],
              ),
              children: <Widget>[
                ...post.comentarios.map((comentario) {
                  return _buildItemComentario(comentario);
                }).toList(),
                _buildItemComentar()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemComentario(Comentario comentario) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 16.0,
                child: Icon(
                  Icons.person_outline,
                  size: 16.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(comentario.usuario,
                    style: Theme.of(context).textTheme.subtitle),
              )
            ],
          ),
          SizedBox(height: 4.0),
          Text(comentario.conteudo),
        ],
      ),
    );
  }

  Widget _buildItemComentar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: TextFormField(
        expands: false,
        decoration: InputDecoration(
          icon: CircleAvatar(
            radius: 16.0,
            child: Icon(
              Icons.person_outline,
              size: 16.0,
            ),
          ),
          hintText: "Digite aqui seu comentário...",
          hintStyle:
              Theme.of(context).textTheme.body1.copyWith(color: Colors.grey),
          suffix: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              onPressed: () {},
              child: Text("Comentar",
                  style: Theme.of(context)
                      .textTheme
                      .subhead
                      .copyWith(color: theme.secondaryColor))),
          contentPadding: const EdgeInsets.only(left: 8.0),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) async {
    return showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
                opacity: a1.value,
                child: MyDialog(
                  title: "Adicionar Postagem",
                  content: DialogAdicionarPostagem(),
                  funConfirmar: _adicionarPostagem,
                )),
          );
        },
        transitionDuration: Duration(milliseconds: 300),
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  Function get _adicionarPostagem => () {
        Navigator.pop(context);
      };
}
