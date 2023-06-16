import 'package:flutter/material.dart';
import 'package:furny/controllers/search_screen_controller.dart';
import 'package:get/get.dart';

class CustomField extends GetView<SearchScreenController> {
  const CustomField({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(20)),
        ),
        onChanged: (value) => controller.refresh(),
      ),
    );
  }
}
