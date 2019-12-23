import 'package:flutter/material.dart';
import 'package:tinder/ui/widgets/empty/empty_view.dart';

abstract class ContentPlaceHolderBase extends StatelessWidget {
  final VoidCallback onItemInteraction;

  const ContentPlaceHolderBase({this.onItemInteraction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: EmptyView(message: buildMessage(context))),
            ],
          ),
        ),
      ),
      onTap: onItemInteraction,
    );
  }

  Widget buildIconView(BuildContext context);

  String buildMessage(BuildContext context);
}
