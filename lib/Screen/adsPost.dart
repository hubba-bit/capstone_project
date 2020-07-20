import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bechdoapp/imageUpload.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

// ignore: non_constant_identifier_names
Future<String> _adPost(String Title, String Description, String Price,
    String mobile, String category) async {
  final docRef = Firestore.instance.collection('posts').document();
  await docRef.setData({
    'title': Title,
    'subtitle': Description,
    'price': Price,
    'mobile': mobile,
    'category': category,
    'createdAt': FieldValue.serverTimestamp()
  });
  return docRef.documentID;
}

class AdsPost extends StatelessWidget {
  //File _imageFile;
  final String category;
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  final d = TextEditingController();

  AdsPost(this.category);

  /*void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.indigo[400],
        backgroundColorEnd: Colors.indigo,
        // title: TextEditingController(Text:text),
        elevation: 17.0,
        actions: <Widget>[
          FlatButton(
            padding: EdgeInsets.all(7.0),
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              softWrap: true,
            ),
            color: Colors.black12,
            onPressed: () async {
              final docId =
                  await _adPost(a.text, b.text, c.text, d.text, category);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdsPostImageUpload(docId)));
            },
          )
        ],
      ),
      body: _adsPosting(context),
    );
  }

  Widget _adsPosting(BuildContext context) {
    final double height = ((MediaQuery.of(context).size.height - 100) / 1) - 24;
    final double width = (MediaQuery.of(context).size.width / 1) - 27;

    return Container(
      margin: EdgeInsets.all(30.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[200], Colors.white30, Colors.grey[300]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius

        border: Border.all(
          color: Colors.grey[100],
        ),
      ),
      child: Column(children: <Widget>[
        SizedBox(
          height: 28.0,
        ),
        Text(
          'Post Your Ad',
          style: TextStyle(
              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 40.0,
        ),
        TextFormField(
          maxLength: 34,
          controller: a,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            helperText: 'Enter Your Ad Title  Here',
            helperStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: 'Title',
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        TextFormField(
          maxLength: 200,
          controller: b,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            // hintText: 'Tell us about yourself',

            helperText: 'Enter Your Ad Description  Here',
            helperStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: 'Description',
            isDense: true,
            // Added this
            contentPadding: EdgeInsets.fromLTRB(14, 0, 0, 80),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        TextFormField(
          controller: c,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            helperText: 'Enter Your Ad Price  Here',
            helperStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: 'Price',
            prefixText: 'RS :',
          ),
          keyboardType: TextInputType.number,
        ),

        /* SizedBox(
          height: 28.0,
        ),*/
        TextFormField(
          controller: d,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
            ),
            helperText: 'Enter Your Phone Number',
            helperStyle: TextStyle(
              color: Colors.black,
            ),
            labelText: 'Mobile No',
            prefixText: '+92',
          ),
          keyboardType: TextInputType.number, //^(?:[+0]9)?[0-9]{10}$);
        ),
      ]),
    );
  }
}
