import 'package:flutter/material.dart';
import 'package:furny/view/widgets/class_screen_viewer.dart';

class Carpets extends StatelessWidget {
  const Carpets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassScreen(classification: "carpet");
  }
}
