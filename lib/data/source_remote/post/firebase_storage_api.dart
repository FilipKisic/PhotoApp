import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApi {
  final FirebaseStorage _instance = FirebaseStorage.instance;

  Future<String> uploadImage(final File image) async {
    final snapshot = await _instance.ref().child('post${DateTime.now().millisecondsSinceEpoch}').putFile(image);
    return await snapshot.ref.getDownloadURL();
  }

  Future<String> getDownloadUrl(final String imageName) async => await _instance.ref().child(imageName).getDownloadURL();
}
