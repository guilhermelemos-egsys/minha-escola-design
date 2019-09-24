import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';

class DialogCadastrarPeriodo extends StatefulWidget {
  @override
  _DialogCadastrarPeriodoState createState() => _DialogCadastrarPeriodoState();
}

class _DialogCadastrarPeriodoState extends State<DialogCadastrarPeriodo> {
  DateTime _dataInicial;
  DateTime _dataFinal;
  bool _autoValidade = false;

  final _keyForm = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final format = DateFormat.MMMMd();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      autovalidate: _autoValidade,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nome,
            validator: validarNomePeriodo,
            decoration: InputDecoration(
              labelText: 'Descrição',
            ),
          ),
          SizedBox(height: 8.0),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            color: theme.primaryColor,
            onPressed: () async {
              await displayDataRange(context);
            },
            child: Text(
              "Selecionar Datas",
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: theme.secondaryTextColor),
            ),
          ),
          Text(_dataInicial == null && _dataFinal == null
              ? "Nenhuma data selecionada"
              : "${format.format(_dataInicial)} à ${format.format(_dataFinal)}"),
        ],
      ),
    );
  }

  ///Reponsável por validar o campo "nomePeriodo"
  String validarNomePeriodo(String nome) {
    if (nome.isEmpty) {
      return "Informe um período";
    }
    return null;
  }

  Future displayDataRange(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
        context: context,
        initialFirstDate: DateTime.now(),
        initialLastDate: (DateTime.now()).add(Duration(days: 7)),
        firstDate: DateTime(2019),
        lastDate: DateTime(2021));
    if (picked != null && picked.length == 2) {
      setState(() {
        _dataInicial = picked[0];
        _dataFinal = picked[1];
      });
    }
  }

  @override
  void dispose() {
    _nome.dispose();
    super.dispose();
  }

  ///Responsável por validar o formulario de edição de um período
  void _enviarForm() {
    if (_keyForm.currentState.validate() &&
        _dataInicial != null &&
        _dataFinal != null) {
      _keyForm.currentState.save();
      Navigator.pop(context);
    } else {
      setState(() {
        _autoValidade = true;
      });
    }
  }
}
