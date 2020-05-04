import 'package:flutter/material.dart';

class GameButton {
  final int id;
  String text;
  Color bg;
  bool enable;
  GameButton(
      {this.id, this.text = "", this.bg = Colors.grey, this.enable = true});
}
