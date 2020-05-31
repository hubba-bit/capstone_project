import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screen/listView.dart';
import 'customRaisedBtn.dart';
import 'package:flutter/widgets.dart';


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
            context, MaterialPageRoute(builder: (context) => ListScreen()));
      },
      borderRadius: 20.0,
    );
  }
}

