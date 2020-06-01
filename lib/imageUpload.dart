import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
class ImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  FirebaseStorage storage = FirebaseStorage.instance;

  File image;
  try {
  //Get the file from the image picker and store it
  image = await ImagePicker.pickImage(source: ImageSource.gallery);

  } on PlatformException catch (e) {
  //PlatformException is thrown with code : this happen when user back with don't
  //selected image or not approve permission so stop method here
  // check e.code to know what type is happen
  return;
  }

  //Create a reference to the location you want to upload to in firebase
  StorageReference reference =
  storage.ref().child("profileImages/${user.id}");

  //Upload the file to firebase
  StorageUploadTask uploadTask = reference.putFile(image);

  StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

  // Waits till the file is uploaded then stores the download url
  String url = await taskSnapshot.ref.getDownloadURL();
  @override
  Widget build(BuildContext context) {
    Widget enableUpload() {
      return Container(
        child: Column(
          children: <Widget>[
            Image.file(sampleImage, height: 300.0, width: 300.0),
            RaisedButton(
              elevation: 7.0,
              child: Text('Upload'),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                final StorageReference firebaseStorageRef =
                FirebaseStorage.instance.ref().child('myimage.jpg');
                final StorageUploadTask task =
                firebaseStorageRef.putFile(sampleImage);

              },
            )
          ],
        ),
      );
    }
  }
}
