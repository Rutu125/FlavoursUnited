import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flavours_united/constants.dart';
import 'package:flavours_united/storage_services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flavours_united/image_magnifier.dart';

FirebaseStorage storage = FirebaseStorage.instance;
final _fire = FirebaseFirestore.instance.collection('imgURL');

class FoodScreen extends StatefulWidget {
  static String id = 'food_screen';

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    final StorageFI storage = StorageFI('food');

    return Scaffold(
      appBar: kAppBar,
      body: Column(
        children: [MessageStream()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final results =
              await FilePicker.platform.pickFiles(allowMultiple: false);

          if (results == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No file selected'),
              ),
            );
            return null;
          }

          final path = results.files.single.path!;
          final fileName = results.files.single.name;

          storage.uploadFile(path, fileName).then(
                (value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('File Uploaded'),
                  ),
                ),
              );
        },
        child: Icon(Icons.cloud_upload_rounded),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fire.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepOrange,
            ),
          );
        }

        return Flexible(
          child: GridView.count(
              crossAxisCount: 3,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageMagnifier(Image(
                                  image: NetworkImage(data['image']),
                                ))));
                  },
                  child: Image(
                    image: NetworkImage(
                      data['image'],
                    ),
                  ),
                );
              }).toList()),
        );
      },
    );
  }
}
