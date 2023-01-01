import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_state_manager/get_state_manager.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class firebaseStorageService extends GetxService {
  Future<String?> getImage(String? image) async {
    if (image == null) {
      return null;
    }

    try {
      var urlRef = firebaseStorage.child(image);
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
}
