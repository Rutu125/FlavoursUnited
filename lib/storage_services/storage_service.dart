import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

final _firestore = FirebaseFirestore.instance.collection('imgURL');

class StorageFI {
  StorageFI(this.folderName);
  String folderName;

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage.ref('$folderName/$fileName').putFile(file);
      String downloadURL =
          await storage.ref('$folderName/$fileName').getDownloadURL();
      print(downloadURL);

      DocumentReference doc = _firestore.doc();
      doc.set({
        'image': downloadURL,
      });
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}
