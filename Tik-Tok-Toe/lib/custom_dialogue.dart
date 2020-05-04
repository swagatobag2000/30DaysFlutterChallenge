import 'package:flutter/material.dart';

class CustomDialogue extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;
  CustomDialogue(this.title, this.content, this.callback,
      [this.actionText = "Reset"]);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: callback,
          child: Text(actionText),
          color: Colors.white,
        )
      ],
    );
  }
}
