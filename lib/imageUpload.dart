import 'dart:io';
import 'dart:math';
import 'package:bechdoapp/Screen/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

import 'Screen/listView.dart';

class AdsPostImageUpload extends StatefulWidget {
  final String docId;

  const AdsPostImageUpload(this.docId);
  @override
  _AdsPostImageUploadState createState() => _AdsPostImageUploadState();
}

class _AdsPostImageUploadState extends State<AdsPostImageUpload> {
  File _image;
  String _uploadedFileURL;

  Future chooseFile() async {
    // ignore: deprecated_member_use
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('ads/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    final imageUrl = await storageReference.getDownloadURL();
    final docRef =
        Firestore.instance.collection('posts').document(this.widget.docId);
    await docRef.updateData({'imageUrl': imageUrl});

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigo[400],
        backgroundColorEnd: Colors.indigo,
        title: Text('Upload Your Photos'),
        elevation: 17.0,
        /*actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(7.0),
            child: Text(
              'Post Now',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              softWrap: true,
            ),
            color: Colors.black12,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListScreen()));
            },
          )
        ],*/
      ),
      body: _SubmitPost(context),
    );
  }

  Widget _SubmitPost(BuildContext context) {
    final double height = ((MediaQuery.of(context).size.height - 100) / 1) - 24;
    final double width = (MediaQuery.of(context).size.width / 1) - 27;

    return Container(
      margin: EdgeInsets.all(30.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius

        border: Border.all(
          color: Colors.grey[100],
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
            ),
            iconSize: 45.0,
          ),
          SizedBox(
            height: 13.0,
          ),
          _image != null
              ? Image.asset(
                  _image.path,
                  height: 240,
                )
              : Container(
                  height: 220,
                ),
          SizedBox(
            height: 13.0,
          ),
          _image == null
              ? SizedBox(
                  width: 400.0,
                  height: 40.0,
                  child: RaisedButton(
                    elevation: 15.0,
                    child: Text(
                      'Choose  File',
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: chooseFile,
                    color: Colors.blueAccent,
                  ),
                )
              : Container(),
          _image != null
              ? SizedBox(
                  width: 400.0,
                  height: 40.0,
                  child: RaisedButton(
                    child: Text(
                      'Post Now',
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: uploadFile,
                    color: Colors.blueAccent,
                  ))
              : Container(),
          SizedBox(
            height: 13.0,
          ),
          _image != null
              ? SizedBox(
                  width: 400.0,
                  height: 40.0,
                  child: RaisedButton(
                    child: Text(
                      'Clear Selection',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: clearSelection,
                  ),
                )
              : Container(),
          _uploadedFileURL != null
              ? Image.network(
                  _uploadedFileURL,
                  height: 150,
                )
              : Container(),
        ],
      ),
    );
  }

  void clearSelection() {
    print('section clear');
  }
}
