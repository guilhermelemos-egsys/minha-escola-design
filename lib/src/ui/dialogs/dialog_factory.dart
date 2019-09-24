import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<T> showDialog<T>(BuildContext context, Widget child) async {
  final result = showGeneralDialog<T>(
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: child,
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 300),
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {},
  );

  return result;
}
