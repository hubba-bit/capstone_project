import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customRaisedBtn.dart';
import 'package:flutter/widgets.dart';

import 'listView.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final IconData icon;
  MenuButton({@required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return customRaisedBtn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () => {},
            color: Colors.blue,
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
            child: Column(
              // Rep
              // lace with a Row for horizontal icon + text
              children: <Widget>[
                Icon(
                  icon,
                  size: 33.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            text,
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
      color: Colors.white,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdsListingPage()));
      },
      borderRadius: 20.0,
    );
  }
}
/*
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
*/
