import 'package:flutter/material.dart';
import 'package:furny/controllers/search_screen_controller.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/core/links.dart';
import 'package:furny/model/object_model.dart';
import 'package:furny/view/screens/object_in_screen.dart';
import 'package:furny/view/widgets/custom_object_tile.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class FavoriteScreen extends StatelessWidget with Crud {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SearchScreenController());
    getFavoriteObjects() async {
      var response = await postRequest(
        readFromFavoriteLink,
        {"user_id": 2.toString()},
      );
      return response;
    }

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
            "Favorite ...",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              FutureBuilder(
                future: getFavoriteObjects(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData && snapshot.data['data'] != null) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data['data'].length,
                      itemBuilder: (context, index) {
                        ObjectModel objectModel =
                            ObjectModel.fromJson(snapshot.data['data'][index]);
                        return CustomObjectTile(
                          objectModel: objectModel,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ObjectInScreen(objectModel: objectModel),
                            ));
                          },
                          onDelete: () async {
                            await postRequest(removeFromFavoriteLink, {
                              "user_id": 2.toString(),
                              "object_id": objectModel.objectId.toString(),
                            });
                            controller.refresh();
                          },
                        );
                      },
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(child: Text("No Objects Found ..."));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loading ..."));
                  }
                  return Center(child: Text("Loading ..."));
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
