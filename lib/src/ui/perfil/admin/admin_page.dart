import 'package:design/src/domain/model/item_lista_menu.dart';
import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/perfil/admin/avaliacoes/avaliacoes_admin_page.dart';
import 'package:design/src/ui/perfil/admin/disciplinas/disciplinas_admin_page.dart';
import 'package:design/src/ui/perfil/admin/horarios/horarios_admin_page.dart';
import 'package:design/src/ui/perfil/admin/periodos/periodos_admin_page.dart';
import 'package:design/src/ui/perfil/admin/tarefas/tarefas_admin_page.dart';
import 'package:design/src/ui/perfil/admin/tipos_de_tarefa/tipos_da_tarefa.dart';
import 'package:design/src/ui/perfil/admin/usuarios/usuarios_admin_page.dart';
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<ItemListaMenu> _itensMenu = [];

  @override
  void initState() {
    _itensMenu = [
      ItemListaMenu(
          icone: Icons.access_time,
          titulo: "Horários",
          onclick: _moveToHorarios),
      ItemListaMenu(
          icone: Icons.assignment, titulo: "Tarefas", onclick: _moveToTarefas),
      ItemListaMenu(
          icone: Icons.description,
          titulo: "Tipos de Tarefa",
          onclick: _moveToTiposDeTarefa),
      ItemListaMenu(
          icone: Icons.date_range,
          titulo: "Períodos",
          onclick: _moveToPeriodos),
      ItemListaMenu(
          icone: Icons.import_contacts,
          titulo: "Disciplinas",
          onclick: _moveToDisciplinas),
      ItemListaMenu(
          icone: Icons.assessment ,
          titulo: "Avaliações",
          onclick: _moveToAvaliacoes),
      ItemListaMenu(
          icone: Icons.group, titulo: "Usuários", onclick: _moveToUsuarios)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Administrador"),
      ),
      body: ListView(children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 32.0),
            color: Colors.orange,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.build,
                  color: theme.primaryIconColor,
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Olá, Guilherme!",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      "Gerencie sua turma por aqui...",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: theme.secondaryTextColor, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        ..._itensMenu.map((item) {
          return _buildItemLista(item);
        }).toList(),
      ]),
    );
  }

  Widget _buildItemLista(ItemListaMenu item) {
    return ListTile(
      onTap: item.onclick,
      leading: Icon(item.icone),
      title: Text(item.titulo),
    );
  }

  Function get _moveToHorarios => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HorariosAdminPage()),
        );
      };

  Function get _moveToTarefas => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TarefasAdminPage()),
        );
      };

  Function get _moveToTiposDeTarefa => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TiposDeTarefaAdminPage()),
        );
      };

  Function get _moveToDisciplinas => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DisciplinasAdminPage()),
        );
      };

  Function get _moveToPeriodos => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PeriodosAdminPage()),
        );
      };

  Function get _moveToAvaliacoes => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AvaliacoesAdminPage()),
        );
      };

  Function get _moveToUsuarios => () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UsuariosAdminPage()),
        );
      };
}
