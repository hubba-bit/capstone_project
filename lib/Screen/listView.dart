import 'package:bechdoapp/Screen/adsPost.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:bechdoapp/menuButton.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'detailAdScreen.dart';
import 'package:intl/intl.dart';

class ListScreen extends StatefulWidget {
  String category;

  ListScreen({this.category});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future _data;
  @override
  List<IconData> _icons = [
    Icons.directions_car,
    Icons.smartphone,
    Icons.pets,
    Icons.home,
    Icons.business_center,
    Icons.laptop_chromebook,
  ];

  Widget _buildIcon(int index, String category) {
    return Container(
      height: 55.0,
      width: 55.0,
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: RaisedButton(
        child: Icon(
          _icons[index],
          size: 30.0,
          color: Theme.of(context).accentColor,
        ),
        onPressed: () {
          setState(() {
            widget.category = category;
          });
        },
      ),
    );
  }

  navigateToDetail(DocumentSnapshot posts) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailAdPage(
                  posts: posts,
                )));
  }

  main() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print(formattedDate); // 2016-01-25
  }

  @override
  void initState() {
    super.initState();
    _data = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),

          // backgroundColor: Colors.indigo,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AdsPost(widget.category)));
          },
          elevation: 5.0,
          splashColor: Colors.blueGrey,
        ),
        appBar: GradientAppBar(
          backgroundColorStart: Colors.indigo[400],
          backgroundColorEnd: Colors.indigo,
          elevation: 20.0,
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 120.0, top: 16.0),
            child: Text(
              'List of posts for category ${widget.category}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildIcon(0, 'Vehicles'),
              _buildIcon(1, 'Mobiles'),
              _buildIcon(2, 'Animals'),
              _buildIcon(3, 'Property'),
              _buildIcon(4, 'Jobs'),
              _buildIcon(5, 'Electronics'),
            ],
          ),

          /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                */
          SizedBox(
            height: 22.0,
          ),
          Expanded(
            child: FutureBuilder(
                future: getPosts(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text('Loading...'),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        // ignore: missing_return
                        itemBuilder: (_, index) {
                          final imageUrl =
                              snapshot.data[index].data["imageUrl"];
                          final title = snapshot.data[index].data["title"];
                          //   final ImageAssets = Image.asset('images/bechdologo.jpeg');
                          return SizedBox(
                            height: 67.0,
                            child: Card(
                              color: Colors.grey[200],
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: imageUrl != null
                                      ? NetworkImage(imageUrl)
                                      : AssetImage('images/camera2.png'),
                                  radius: 25.0,
                                ),
                                title: Text(snapshot.data[index].data["title"]),
                                onTap: () =>
                                    navigateToDetail(snapshot.data[index]),
                                /* subtitle:
                                      Text(snapshot.data[index].data["subtitle"]),*/
                                trailing: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                    ),
                                    Text('Rs.'),
                                    Text(snapshot.data[index].data["price"]),
                                  ],
                                ),
                              ),
                            ),
                          );
                          // );
                        });
                  }
                }),
          )
        ]));
  }

  Future getPosts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore
        .collection("posts")
        .where('category', isEqualTo: widget.category)
        .orderBy('createdAt', descending: true)
        .getDocuments();
    return qn.documents;
  }
}
