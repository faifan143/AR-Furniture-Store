import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SearchScreenController extends GetxController {
  File myFile = File("assets/images/furnydefault.jpg");
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    print(pickedImage!.path);
    myFile = File(pickedImage!.path);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
