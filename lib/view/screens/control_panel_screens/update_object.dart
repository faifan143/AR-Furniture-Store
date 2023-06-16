import 'package:flutter/material.dart';
import 'package:furny/controllers/search_screen_controller.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/core/links.dart';
import 'package:furny/model/object_model.dart';
import 'package:furny/view/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class UpdateObject extends GetView<SearchScreenController> with Crud {
  const UpdateObject({Key? key, required this.objectModel}) : super(key: key);
  final ObjectModel objectModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController classCtrl = TextEditingController();
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController subtitleCtrl = TextEditingController();
    TextEditingController priceCtrl = TextEditingController();
    TextEditingController descriptionCtrl = TextEditingController();
    TextEditingController imageCtrl = TextEditingController();
    TextEditingController storeNameCtrl = TextEditingController();
    TextEditingController storeLatCtrl = TextEditingController();
    TextEditingController storeLngCtrl = TextEditingController();
    TextEditingController arModelCtrl = TextEditingController();

    classCtrl.text = objectModel.objectClass!;
    titleCtrl.text = objectModel.objectTitle!;
    subtitleCtrl.text = objectModel.objectSubtitle!;
    priceCtrl.text = objectModel.objectPrice!.toString();
    descriptionCtrl.text = objectModel.objectDescription!;
    storeNameCtrl.text = objectModel.objectStoreName!;
    storeLatCtrl.text = objectModel.objectStoreLat!.toString();
    storeLngCtrl.text = objectModel.objectStoreLng!.toString();
    arModelCtrl.text = objectModel.objectArModel!;

    Get.put(SearchScreenController());

    final appBarTitle = const Text(
      "Update Object",
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w300,
        fontSize: 20,
      ),
    );

    final appBarLeadingIcon = IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        IconlyBroken.arrow_left,
        color: Colors.black,
      ),
    );

    final appBar = AppBar(
      backgroundColor: Colors.white,
      leading: appBarLeadingIcon,
      title: appBarTitle,
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomField(
              labelText: "Object Class",
              textEditingController: classCtrl,
            ),
            const SizedBox(height: 10),
            CustomField(
              labelText: "Object Title",
              textEditingController: titleCtrl,
            ),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object Subtitle",
                textEditingController: subtitleCtrl),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object Price", textEditingController: priceCtrl),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object Description",
                textEditingController: descriptionCtrl),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: controller.pickImage,
              icon: Icon(
                Icons.photo_camera,
                color: Colors.white,
              ),
              label: Text(
                "Change Image",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Nunito',
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                fixedSize: Size.fromHeight(50),
              ),
            ),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object Store Name",
                textEditingController: storeNameCtrl),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object Store Latitude",
                textEditingController: storeLatCtrl),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object Store Longitude",
                textEditingController: storeLngCtrl),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object AR Model",
                textEditingController: arModelCtrl),
            const SizedBox(height: 10),
            OutlinedButton(
                onPressed: () async {
                  var response;
                  if (classCtrl.text.isNotEmpty &&
                      titleCtrl.text.isNotEmpty &&
                      subtitleCtrl.text.isNotEmpty &&
                      priceCtrl.text.isNotEmpty &&
                      descriptionCtrl.text.isNotEmpty &&
                      storeNameCtrl.text.isNotEmpty &&
                      storeLatCtrl.text.isNotEmpty &&
                      storeLngCtrl.text.isNotEmpty &&
                      arModelCtrl.text.isNotEmpty) {
                    response = await postFile(
                      url: updateObjectLink,
                      data: {
                        "object_id": objectModel.objectId.toString(),
                        "object_class": classCtrl.text,
                        "object_title": titleCtrl.text,
                        "object_subtitle": subtitleCtrl.text,
                        "object_price": priceCtrl.text,
                        "object_description": descriptionCtrl.text,
                        "object_store_name": storeNameCtrl.text,
                        "object_store_lat": storeLatCtrl.text,
                        "object_store_lng": storeLngCtrl.text,
                        "object_ar_model": arModelCtrl.text,
                        "object_image": objectModel.objectImage,
                      },
                      fileRequestName: "file",
                      file: controller.myFile!,
                    );
                  }
                  controller.refresh();
                  if (response['status'] == "success") {
                    Navigator.of(context).pop();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      IconlyBroken.tick_square,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text("Update",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito',
                        )),
                  ],
                )),
            const SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
