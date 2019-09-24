import 'package:design/src/ui/colors/minha_escola_colors.dart' as theme;
import 'package:flutter/material.dart';
class MyDialogVisualizacao extends StatelessWidget {
  final String title;
  final Widget content;
  final Function onSuccess;
  MyDialogVisualizacao({this.title, this.content, this.onSuccess});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      titlePadding: const EdgeInsets.all(16.0),
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      contentPadding:
          const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Divider(height: 0.0),
          SizedBox(height: 8.0),
          content
        ],
      ),
      actions: <Widget>[
        RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          padding: const EdgeInsets.all(8.0),
          onPressed: () {
            Navigator.pop(context);
          },
          color: theme.primaryColor,
          child: Text(
            "Voltar",
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: theme.secondaryTextColor),
          ),
        ),
      ],
    );
  }
}
