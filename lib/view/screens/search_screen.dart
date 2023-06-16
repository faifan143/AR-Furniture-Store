import 'package:flutter/material.dart';
import 'package:furny/controllers/search_screen_controller.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/core/links.dart';
import 'package:furny/model/object_model.dart';
import 'package:furny/view/screens/object_in_screen.dart';
import 'package:furny/view/widgets/custom_field.dart';
import 'package:furny/view/widgets/custom_object_tile.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatelessWidget with Crud {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    getSearchResults() async {
      var response = await postRequest(searchLink, {
        "search_text":
            searchController.text.isNotEmpty && searchController.text.length > 1
                ? searchController.text
                : null,
      });
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
            "Search . . . ",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.w300),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                CustomField(
                  textEditingController: searchController,
                  labelText: 'What do you need ?',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 2000,
                  child: FutureBuilder(
                    future: getSearchResults(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data['data'] != null) {
                        return ListView.builder(
                          itemCount: snapshot.data['data'].length,
                          itemBuilder: (context, index) {
                            ObjectModel objectModel = ObjectModel.fromJson(
                                snapshot.data['data'][index]);
                            return CustomObjectTile(
                                objectModel: objectModel,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ObjectInScreen(
                                        objectModel: objectModel),
                                  ));
                                });
                          },
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: Text("Loading ..."));
                      }
                      return const Center(child: Text("Loading ..."));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
