
import 'package:bechdoapp/Screen/listView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bechdoapp/imageUpload.dart';
// ignore: non_constant_identifier_names
Future<void> _adPost(String Title, String Description, String Price,String Mobile) async {
  await Firestore.instance.collection('posts').document().setData({
    'title': Title,
    'subtitle': Description,
    'price': Price,
    'Mobile': Mobile,

  });
}

class AdsPost extends StatelessWidget {
  //File _imageFile;
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  final d = TextEditingController();

//  final e = TextEditingController();

  // ignore: missing_return

  /*void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Post Your Ad'),
        backgroundColor: Colors.indigo,
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
            onPressed: () {
              _adPost(a.text, b.text, c.text, d.text);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          )
        ],
      ),
      body: _adsPosting(context),
    );
  }

  Widget _adsPosting(BuildContext context) {
    final double height = ((MediaQuery
        .of(context)
        .size
        .height - 100) / 1) - 24;
    final double width = (MediaQuery
        .of(context)
        .size
        .width / 1) - 27;

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
          controller: a,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            helperText: 'Enter Your Ad Title  Here',
            labelText: 'Title',
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        TextFormField(
          controller: b,
          decoration: new InputDecoration(
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            // hintText: 'Tell us about yourself',

            helperText: 'Enter Your Ad Description  Here',
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
            labelText: 'Price',

          ),
          keyboardType: TextInputType.number,
        ),

        SizedBox(
          height: 28.0,
        ),
        TextFormField(
          controller: d,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
              helperText: 'Enter Your Phone Number',
              labelText: 'Mobile No'),
          keyboardType: TextInputType.number,
// initialValue: "5",
//      onSaved: (input) => _value = num.tryParse(input),

        ),
      ]),
    );
  }


}