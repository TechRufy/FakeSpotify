import 'package:flutter_application_1/Entity/firebase_service_storage.dart';
import 'package:get_state_manager/get_state_manager.dart';

class AlbumImageController extends GetxController {
  final image = <String>[].obs;

  void onReady() {
    super.onReady();
  }

  getImage(String? img) async {
    try {
      final url = await Get.find<firebaseStorageService>().getImage(img);
      image.add(url);
      return url;
    } catch (e) {}
  }
}
