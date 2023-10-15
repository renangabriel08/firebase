import 'package:firebase_storage/firebase_storage.dart';

class Upload {
  static uploadImage(image) async {
    try {
      String imgName = image.path.split('/').last;
      await FirebaseStorage.instance.ref("images/$imgName").putFile(image);
    } catch (e) {
      print(e);
    }
  }
}
