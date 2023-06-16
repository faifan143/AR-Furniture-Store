import 'package:flutter/material.dart';
import 'package:furny/model/object_model.dart';
import 'package:furny/view/screens/object_in_screen.dart';
import 'package:furny/view/widgets/custom_object_tile.dart';
import 'package:iconly/iconly.dart';

class CustomControlPanelObject extends StatelessWidget {
  const CustomControlPanelObject({
    super.key,
    required this.objectModel,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  final ObjectModel objectModel;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomObjectTile(
            objectModel: objectModel,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ObjectInScreen(objectModel: objectModel),
              ));
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: onEditTap,
                    icon: Icon(
                      IconlyBroken.edit,
                      color: Colors.blueAccent,
                    )),
                IconButton(
                    onPressed: onDeleteTap,
                    icon: Icon(
                      IconlyBroken.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
