import 'package:design/src/domain/model/comentario.dart';

class Post {
  String titulo;
  String conteudo;
  String usuario;
  DateTime dataPostagem;
  List<Comentario> comentarios;

  Post({this.titulo, this.conteudo, this.usuario, this.dataPostagem, this.comentarios});
}