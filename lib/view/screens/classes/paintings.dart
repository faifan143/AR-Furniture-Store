import 'package:flutter/material.dart';
import 'package:furny/view/widgets/class_screen_viewer.dart';

class Paintings extends StatelessWidget {
  const Paintings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassScreen(classification: "painting");
  }
}
