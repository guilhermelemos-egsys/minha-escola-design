import 'package:design/src/ui/widgets/custom_shape_clipper.dart';
import 'package:flutter/material.dart';

class HeaderPagesAdmin extends StatelessWidget {
  final int count;
  final String title;

  HeaderPagesAdmin({this.count, this.title});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Container(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 32.0),
        color: Colors.orange,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 16.0,
              child: Text(count.toString()),
            ),
            SizedBox(width: 8.0),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
