import 'package:flutter/material.dart';
import 'package:furny/controllers/search_screen_controller.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/core/links.dart';
import 'package:furny/view/widgets/custom_field.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CreateObject extends GetView<SearchScreenController> with Crud {
  const CreateObject({Key? key}) : super(key: key);
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
    Get.put(SearchScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(IconlyBroken.arrow_left, color: Colors.black)),
        title: const Text(
          "Create Object",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CustomField(
                labelText: "Object Class", textEditingController: classCtrl),
            const SizedBox(height: 10),
            CustomField(
                labelText: "Object Title", textEditingController: titleCtrl),
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
            InkWell(
              onTap: () {
                controller.pickImage();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Change Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Nunito'),
                )),
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
                        url: createObjectLink,
                        data: {
                          "object_class": classCtrl.text,
                          "object_title": titleCtrl.text,
                          "object_subtitle": subtitleCtrl.text,
                          "object_price": priceCtrl.text,
                          "object_description": descriptionCtrl.text,
                          "object_store_name": storeNameCtrl.text,
                          "object_store_lat": storeLatCtrl.text,
                          "object_store_lng": storeLngCtrl.text,
                          "object_ar_model": arModelCtrl.text,
                        },
                        fileRequestName: 'object_image',
                        file: controller.myFile!);
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
                    Text("Create",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito',
                        )),
                    SizedBox(width: 5),
                    Icon(
                      IconlyBroken.tick_square,
                      size: 20,
                    )
                  ],
                )),
            const SizedBox(height: 10),
          ],
        ),
      )),
    );
  }
}
