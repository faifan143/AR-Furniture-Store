import 'package:flutter/material.dart';
import 'package:furny/core/links.dart';
import 'package:furny/model/object_model.dart';

class CustomObjectTile extends StatelessWidget {
  CustomObjectTile({
    super.key,
    required this.objectModel,
    required this.onTap,
    this.onDelete,
  });
  ObjectModel objectModel;
  VoidCallback onTap;
  VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onDelete,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading:
              Image.network("$uploadFolderLink${objectModel.objectImage!}"),
          title: Text(objectModel.objectTitle!),
          subtitle: Text(objectModel.objectSubtitle!),
          trailing: IconButton(
              onPressed: onTap, icon: const Icon(Icons.open_in_full)),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          tileColor: Colors.white,
        ),
      ),
    );
  }
}
