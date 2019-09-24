import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/forum/forum.dart';
import 'package:design/src/ui/notas/notas.dart';
import 'package:design/src/ui/perfil/perfil.dart';
import 'package:design/src/ui/turma/turma.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: theme.secondaryColor,
        tabs: [
          TabData(iconData: Icons.group, title: "Turma"),
          TabData(iconData: Icons.forum, title: "Fórum"),
          TabData(iconData: Icons.insert_chart, title: "Notas"),
          TabData(iconData: Icons.person_outline, title: "Perfil"),
        ],
        onTabChangedListener: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _selecionarTela(_index),
    );
  }

  Widget _selecionarTela(_index) {
    switch (_index) {
      case 0:
        return TurmaPage();
        break;
      case 1:
        return ForumPage();
        break;
      case 2:
        return NotasPage();
        break;
      case 3:
        return PerfilPage();
        break;
    }
  }
}
