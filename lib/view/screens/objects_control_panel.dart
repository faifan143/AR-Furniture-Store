import 'package:flutter/material.dart';
import 'package:furny/controllers/search_screen_controller.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/core/links.dart';
import 'package:furny/model/object_model.dart';
import 'package:furny/view/screens/control_panel_screens/create_object.dart';
import 'package:furny/view/screens/control_panel_screens/update_object.dart';
import 'package:furny/view/widgets/custom_cp_object.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ObjectsCP extends StatelessWidget with Crud {
  const ObjectsCP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllObjects() async {
      var response = await postRequest(readAllObjectLink, {});
      return response;
    }

    Get.put(SearchScreenController());
    return GetBuilder<SearchScreenController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                IconlyBroken.arrow_left,
                color: Colors.black,
              )),
          title: const Text(
            "Control Panel",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                fontFamily: 'Nunito',
                color: Colors.black),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 5,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreateObject()));
            },
            child: const Icon(
              IconlyLight.plus,
              color: Colors.black,
            )),
        body: SafeArea(
            child: ListView(
          children: [
            FutureBuilder(
              future: getAllObjects(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data['data'] != null) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data['data'].length,
                      itemBuilder: (context, index) {
                        ObjectModel objectModel =
                            ObjectModel.fromJson(snapshot.data['data'][index]);
                        return CustomControlPanelObject(
                          objectModel: objectModel,
                          onEditTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  UpdateObject(objectModel: objectModel),
                            ));
                          },
                          onDeleteTap: () async {
                            await postRequest(deleteObjectLink,
                                {"object_id": objectModel.objectId.toString()});
                            controller.refresh();
                          },
                        );
                      });
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Center(child: Text("No Results . . ."));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading . . ."));
                }
                return const Center(child: Text("Loading . . ."));
              },
            ),
          ],
        )),
      );
    });
  }
}
