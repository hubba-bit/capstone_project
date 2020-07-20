import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screen/listView.dart';
import 'customRaisedBtn.dart';
import 'package:flutter/widgets.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final IconData icon;
  MenuButton({
    @required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
            bottomLeft: Radius.circular(17),
            bottomRight: Radius.circular(17)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: customRaisedBtn(
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
              context,
              MaterialPageRoute(
                  builder: (context) => ListScreen(
                        category: text,
                      )));
        },
        borderRadius: 20.0,
      ),
    );
  }
}
