import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class StorageHelper {
  Future<String?> uploadImageFromFile(File file);
}

class StorageHelperImpl extends StorageHelper {
  @override
  Future<String?> uploadImageFromFile(File file) async {
    String? imageUrl;
    final storageRef = FirebaseStorage.instance.ref();
    final uploadTask = storageRef
        .child('PlacesImages/${file.path.split('/').last}')
        .putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
    if (taskSnapshot.state == TaskState.running) {
      final progress =
          100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
      print("Upload is $progress% complete.");
    } else if (taskSnapshot.state == TaskState.error) {
      throw Exception('error');
    } else if (taskSnapshot.state == TaskState.success) {
      print(imageUrl);
      imageUrl = await taskSnapshot.ref.getDownloadURL();
      return imageUrl;
    }
  }
}