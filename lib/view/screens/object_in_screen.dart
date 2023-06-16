import 'package:flutter/material.dart';
import 'package:furny/core/crud.dart';
import 'package:furny/core/links.dart';
import 'package:furny/model/object_model.dart';
import 'package:iconly/iconly.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ObjectInScreen extends StatelessWidget with Crud {
  ObjectInScreen({Key? key, required this.objectModel}) : super(key: key);
  ObjectModel objectModel;

  @override
  Widget build(BuildContext context) {
    Future<void> launchMap(double lat, double lng) async {
      const String apiKey = "AIzaSyCK4v0sXyMsns5fLeSXkrxdEbJrPClZipg";
      final String googleMapsUrl =
          "https://www.google.com/maps/search/?api=1&query=$lat,$lng";
      if (await canLaunch(googleMapsUrl)) {
        await launch(googleMapsUrl);
      } else {
        throw ('Could not launch $googleMapsUrl');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "$uploadFolderLink${objectModel.objectImage!}",
              ),
              ListTile(
                title: Text(
                  objectModel.objectTitle!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  objectModel.objectSubtitle!,
                  style: const TextStyle(fontSize: 15),
                ),
                trailing: Text(
                  "${objectModel.objectPrice!} S.P.",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Description : ",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito',
                            fontSize: 19)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset.zero,
                              spreadRadius: 3,
                              blurRadius: 3)
                        ],
                        color: Colors.white,
                      ),
                      child: Text(
                        objectModel.objectDescription!,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Nunito ',
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Location : ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Nunito'),
                        ),
                        InkWell(
                          onTap: () async {
                            try {
                              await launchMap(
                                  double.parse(objectModel.objectStoreLat!),
                                  double.parse(objectModel.objectStoreLng!));
                            } catch (e) {
                              throw ("Error launching map: $e");
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.indigoAccent,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                    offset: Offset.zero)
                              ],
                            ),
                            child: Text(
                              objectModel.objectStoreName!,
                              style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                body: ModelViewer(
                                  src: 'assets/ar_models/office_chair.glb',
                                  alt: "A 3D model of an astronaut",
                                  ar: true,
                                  autoRotate: true,
                                  cameraControls: true,
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Open AR Model",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8, right: 8),
                child: OutlinedButton(
                    onPressed: () async {
                      bool available = false;
                      var response = await postRequest(
                          readFromFavoriteLink, {"user_id": 2.toString()});
                      List responseBody = response['data'];
                      for (var element in responseBody) {
                        if (element['object_id'] == objectModel.objectId) {
                          available = true;
                        }
                      }
                      if (available == false) {
                        await postRequest(addToFavoriteLink, {
                          "user_id": '2',
                          "object_id": objectModel.objectId.toString(),
                        });
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Add To Favorite",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(width: 5),
                        Icon(IconlyLight.heart, size: 20),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
