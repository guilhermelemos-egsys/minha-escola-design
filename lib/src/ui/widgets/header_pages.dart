import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {

  final String title;
  final String subtitle;

  HeaderPage({this.title, this.subtitle});
  
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Container(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 32.0),
        color: theme.secondaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 8.0),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
            Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}