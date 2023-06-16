import 'package:flutter/material.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/core/links.dart';
import 'package:furny/model/object_model.dart';
import 'package:furny/view/screens/object_in_screen.dart';
import 'package:furny/view/widgets/custom_object_tile.dart';

class ClassScreen extends StatelessWidget with Crud {
  ClassScreen({
    super.key,
    required this.classification,
  });
  String classification;
  @override
  Widget build(BuildContext context) {
    getObjects() async {
      var response = await postRequest(
          readObjectLink, {"object_class": "$classification"});
      return response;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
              size: 30,
            )),
        title:
            Text(classification + "s", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: ListView(children: [
            FutureBuilder(
              future: getObjects(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data['data'] != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
                          });
                    },
                  );
                }
                if (!snapshot.hasData || snapshot.hasError) {
                  return Center(child: Text("Nothing Found . . ."));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text("Loading . . ."));
                }
                return Center(child: Text("Loading . . ."));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
