import 'package:flutter/material.dart';

import 'content_placeholder_base.dart';

class ErrorView extends ContentPlaceHolderBase {
  final String message;
  final VoidCallback onErrorViewInteraction;

  ErrorView(this.message, {Key key, @required this.onErrorViewInteraction}) : super(onItemInteraction: onErrorViewInteraction);

  @override
  Widget buildIconView(BuildContext context) {
    return Icon(Icons.error_outline);
  }

  @override
  String buildMessage(BuildContext context) {
    return message ?? 'Error';
  }
}
