import 'package:design/src/domain/model/disciplina.dart';

class Periodo {
  String descricao;
  DateTime dataInicio;
  DateTime dataFim;
  List<Disciplina> disciplinas;

  Periodo({this.descricao, this.dataInicio, this.dataFim, this.disciplinas});
}