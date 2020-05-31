import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<void> _adPost(String Title, String Description, String Price) async {
  await Firestore.instance.collection('posts').document().setData({
    'title': Title,
    'subtitle': Description,
    'price': Price,
  });
}

class AdsPost extends StatelessWidget {
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();

  /*void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 17.0,
        actions: <Widget>[
          FlatButton(padding: EdgeInsets.all(7.0),
            child: Text(
              'Post Now',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
              softWrap: true,

            ),

            color: Colors.black12,

            onPressed: () {
              _adPost(a.text, b.text, c.text);
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
            isDense: true,                      // Added this
            contentPadding: EdgeInsets.fromLTRB(14,0,0,80),
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
      ]),
    );
  }
}

/* AdsPostingBtn(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
          ],
        ));*/
