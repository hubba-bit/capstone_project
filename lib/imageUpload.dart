import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

import 'Screen/listView.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




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
        .child('chats/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });

    }
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListScreen()));
  }
  /*uploadImage(){

    var randomno = Random(25);
     final StorageReference firebaseStorageRef = FirebaseStorage.instance
    .ref()
    .child('')
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       /* bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),

    child: Container(
    height: 75,
    child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text('POST NOW',),
    Expanded(

    child: new FittedBox(

      fit: BoxFit.fill,
      child: new Icon(Icons.arrow_forward),

    ),
    ),
      Opacity(
        opacity:0.0,
 *//*
  child:  IconButton(

    icon: Icon(Icons.arrow_forward ),
    iconSize: 100.0,

    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListScreen()));

    })*//*),])

    )
        ),*/



        appBar: AppBar(
          title: Text('Upload Your Photos'),
          backgroundColor: Colors.indigo,
          elevation: 17.0,

        actions: <Widget>[
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
/*
          uploadImage();
*/
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ListScreen()));

          },
            //  padding: EdgeInsets.all(7.0),
              /*child: Text(
                'Post Now',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                softWrap: true,
              ),

              color: Colors.black12,*/
            /*  onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ListScreen()));
*/

            )
          ],
        ),


      body:_SubmitPost(context),
    );}


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
              height: 5.0,            ),
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
                : Container(height: 220),
            SizedBox(
              height: 13.0,
            ),
            _image == null
                ? SizedBox(
              width: 400.0,
                  height: 40.0,
                  child: RaisedButton(

              child: Text('Choose File', style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.white,
              ),),
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

              child: Text('Upload File', style: TextStyle(

                fontSize: 19.0,
                color: Colors.white,
              ),),
              onPressed: uploadFile,
              color: Colors.blueAccent,
            )

                )
                : Container(),
            SizedBox(
              height: 13.0,
            ),
            _image != null
                ? SizedBox(
              width: 400.0,
                  height: 40.0,
                  child: RaisedButton(
              child: Text('Clear Selection',
              style: TextStyle(
                fontSize: 18.0,
              ),),
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
          /*  Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {},
                color: Colors.red[300],
                child: Text(
                  "Button",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            )*/
            /*SizedBox(
              width: 400.0,

              child: Expanded(

                child: Align(
                  alignment: FractionalOffset.bottomCenter,

                  child: MaterialButton(

                    onPressed:() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()));

                    },
                    child: Text( 'POST NOW',

                    style: TextStyle(

                      fontSize: 19.0,
                    ),),

                  ),
                ),

              ),
            ),*/
          ],

        ),

      );



  }

  void clearSelection() {
    print('section clear');
  }
}
