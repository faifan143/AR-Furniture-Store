import 'package:flutter/material.dart';
import 'package:furny/view/widgets/class_screen_viewer.dart';

class Chairs extends StatelessWidget {
  const Chairs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassScreen(
      classification: "chair",
    );
  }
}
