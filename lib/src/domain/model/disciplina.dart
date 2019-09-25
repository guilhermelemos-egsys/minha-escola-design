import 'package:design/src/domain/model/avaliacao.dart';

class Disciplina {
  String nome;
  String nomeProfessor;
  List<Avaliacao> avaliacoes;

  Disciplina({this.nome, this.nomeProfessor, this.avaliacoes});
}