import 'package:bechdoapp/Screen/platformAlertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../menuButton.dart';

class DetailAdPage extends StatefulWidget {
  final DocumentSnapshot posts;

  const DetailAdPage({Key key, this.posts}) : super(key: key);

  @override
  _DetailAdPageState createState() => _DetailAdPageState();
}

class _DetailAdPageState extends State<DetailAdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 150.0,
      ),
      /* child: Card(
        child: ListTile(
          title: Text(widget.posts.data["title"]),
          subtitle:  Text(widget.posts.data["subtitle"]),
        ),
      ),
    );*/

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: 250.0,
                  color: Colors.grey[100],
                  child: Column(
                    //Row(
                    children: <Widget>[
                      widget.posts['imageUrl'] != null
                          ? Image.network(widget.posts['imageUrl'])
                          : Image.asset('images/camera2.png', height: 150.0,),
                       // if (widget.posts["imageUrl"] != null)
                      // Image.network(
                      // widget.posts["imageUrl"],

                      //   fit:BoxFit.fill,
                      //)
                    ],
                    //)
                    // ],
                  ),
                ),
              ),
              /* Positioned(
              child:Hero(

                child: Image(
                  //height: ,
                  //width: ,
                  // image: AssetImage(widget.posts.data),

                ),),),*/
              Container(
                height: 110.0,
                transform: Matrix4.translationValues(0.0, -17.0, 0.0),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                          left: 28.0,
                          right: 30.0,
                          top: 8.0,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 300.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                              Text(
                                widget.posts.data["title"],
                                style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 7.0,
                              ),
                              Text(
                                '\Rs  ${widget.posts.data["price"]}',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ])),
                  ],
                ),
              ),
              Scrollbar(
                isAlwaysShown: true,
                child: Container(
                  width: 500.0,
                  height: 150.0,
                  color: Colors.white30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 6.0),
                        child: Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, top: 5.0),
                        child: Text(
                          widget.posts.data["subtitle"],
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 122.0,
              ),
              Container(
                height: 70.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text(

                        'Contact Seller',

                        style: TextStyle(

                          fontSize: 23.0,

                          color: Colors.white,

                          fontWeight: FontWeight.w500,

                        ),

                      ),
                      onPressed: () => _callAlertDialog(context),
                    ),
                    /* SizedBox(
                      width: 100.0,
                      height: 150.0,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.white,
                        padding: EdgeInsets.all(7.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "CHAT",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Icon(
                              Icons.chat,
                              size: 30.0,
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 150.0,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.white,
                        padding: EdgeInsets.all(7.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "CALL",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Icon(
                              Icons.call,
                              size: 30.0,
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 150.0,
                      child: FlatButton(
                        onPressed: () {},
                        color: Colors.white,
                        padding: EdgeInsets.all(7.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "SMS",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Icon(
                              Icons.message,
                              size: 30.0,
                              color: Colors.indigo,
                            ),
                          ],
                        ),
                      ),
                    ),*/

                    /* SizedBox(
                      width:100.0,
                      height: 120.0,
                      child: RaisedButton(

                        color: Colors.black,

                      ),

                    ),
                    SizedBox(
                      width:100.0,
                      height: 120.0,
                      child: RaisedButton(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width:100.0,
                      height: 120.0,
                      child: RaisedButton(
                        color: Colors.white,
                      ),
                    )*/
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _callAlertDialog(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Contact Seller',
      content: (widget.posts.data["Mobile"].toString()),

     defaultActionText: '',
      cancelActionText: '',
    ).show(context);
    /* if(didRequestSignOut)
      _callAlertDialog(context);
*/
  }
}