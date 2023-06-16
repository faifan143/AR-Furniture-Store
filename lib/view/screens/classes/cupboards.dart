import 'package:flutter/material.dart';
import 'package:furny/view/widgets/class_screen_viewer.dart';

class Cupboards extends StatelessWidget {
  const Cupboards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassScreen(classification: "cupboard");
  }
}
