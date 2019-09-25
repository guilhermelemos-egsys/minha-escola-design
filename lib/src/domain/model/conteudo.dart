import 'package:design/src/domain/model/arquivo.dart';

class Conteudo {
  String titulo;
  String usuario;
  String disciplina;
  List<Arquivo> arquivos;
  String data;

  Conteudo(
      {this.titulo, this.usuario, this.disciplina, this.arquivos, this.data});
}