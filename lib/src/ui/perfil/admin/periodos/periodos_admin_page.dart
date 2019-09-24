import 'package:design/src/ui/dialogs/my_dialog.dart';
import 'package:design/src/ui/dialogs/dialog_factory.dart' as dialogFactory;
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/perfil/admin/avaliacoes/avaliacoes_admin_page.dart';
import 'package:design/src/ui/perfil/admin/periodos/dialog_cadastrar_periodo.dart';
import 'package:design/src/ui/perfil/admin/periodos/dialog_editar_periodo.dart';
import 'package:design/src/ui/widgets/header_pages_admin.dart';
import 'package:design/src/ui/widgets/my_wrap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PeriodosAdminPage extends StatefulWidget {
  @override
  _PeriodosAdminPageState createState() => _PeriodosAdminPageState();
}

class _PeriodosAdminPageState extends State<PeriodosAdminPage> {
  final format = DateFormat.MMMMd();

  
  List<Periodo> _periodos = [
    Periodo(
        descricao: "1º Bimestre",
        dataInicio: DateTime.now(),
        dataFim: DateTime.now().add(Duration(days: 120))),
    Periodo(
        descricao: "2º Bimestre",
        dataInicio: DateTime.now(),
        dataFim: DateTime.now().add(Duration(days: 120))),
    Periodo(
        descricao: "3º Bimestre",
        dataInicio: DateTime.now(),
        dataFim: DateTime.now().add(Duration(days: 120))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Periodos"),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              final result = await dialogFactory.showDialog(
                context,
                MyDialog(
                  title: "Adicionar Período",
                  content: DialogCadastrarPeriodo(),
                  funConfirmar: _adicionarPeriodo,
                  corBotaoConfirmar: theme.secondaryColor,
                ),
              );
              print(result);
            },
            child: Text(
              "Adicionar",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: theme.secondaryTextColor),
            ),
          ),
        ],
      ),
      body: ListView(children: <Widget>[
        HeaderPagesAdmin(
          count: _periodos.length,
          title: "Periodos Cadastrados",
        ),
        ..._periodos.map((periodo) {
          return _buildItemPeriodo(periodo);
        }).toList(),
      ]),
    );
  }

  Widget _buildItemPeriodo(Periodo periodo) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[100]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    periodo.descricao,
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "${format.format(periodo.dataInicio)} à ${format.format(periodo.dataFim)}",
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.grey[700]),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      final result = await dialogFactory.showDialog(
                        context,
                        MyDialog(
                          title: "Editar Período",
                          content: DialogEditarPeriodo(periodo: periodo),
                          funConfirmar: _editarPeriodo,
                        ),
                      );
                      print(result);
                    },
                    icon: Icon(Icons.edit, size: 16.0, color: Colors.grey[700]),
                  ),
                  IconButton(
                    onPressed: () async {
                      final result = await dialogFactory.showDialog(
                        context,
                        MyDialog(
                          title: "Excluir Período",
                          content: _buildContentExcluirPeriodo(),
                          funConfirmar: _excluirPeriodo,
                          corBotaoConfirmar: Colors.red,
                        ),
                      );
                      print(result);
                    },
                    icon:
                        Icon(Icons.delete, size: 16.0, color: Colors.grey[700]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentExcluirPeriodo() {
    return Text("Deseja realmente excluir este período?");
  }

  Function get _adicionarPeriodo => () {
        Navigator.of(context).pop();
      };

  Function get _editarPeriodo => () {
        Navigator.of(context).pop();
      };

  Function get _excluirPeriodo => () {
        Navigator.of(context).pop();
      };
}
