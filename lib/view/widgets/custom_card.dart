import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.text,
    required this.onPress,
    required this.colour,
  });
  String text;
  void Function() onPress;
  Color colour;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 3,
                  color: Colors.black26,
                ),
              ]),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white, shadows: [
                Shadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 0))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
