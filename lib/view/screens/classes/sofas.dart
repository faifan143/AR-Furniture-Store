import 'package:flutter/material.dart';
import 'package:furny/view/widgets/class_screen_viewer.dart';

class Sofas extends StatelessWidget {
  const Sofas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassScreen(classification: "sofa");
  }
}
