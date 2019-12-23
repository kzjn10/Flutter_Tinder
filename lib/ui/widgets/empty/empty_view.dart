import 'package:flutter/material.dart';
import 'package:tinder/ui/utils/my_scroll_behavior.dart';

class EmptyView extends StatelessWidget {
  final String title;
  final String message;
  final double height;

  const EmptyView({Key key, @required this.message, this.title, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyScrollBehavior(),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              child: Icon(Icons.error_outline),
            ),
            Align(
              heightFactor: 1.5,
              alignment: Alignment.center,
              child: Text(
                'No content',
                style: Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
