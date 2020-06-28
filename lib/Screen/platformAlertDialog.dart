import 'package:bechdoapp/Screen/platformWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class PlatformAlertDialog extends PlatformWidget {
  final String title;
  final String  content;
  final String defaultActionText;
  final String cancelActionText;

  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.defaultActionText,
      @required this.cancelActionText})
      : assert(title != null),
        assert(content != null),
        assert(defaultActionText != null);


  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context,
        builder: (context) => this,)
        : await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (context) => this);
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 300.0,
      title: Text(title, style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      ),),
      content: Text(content, style: TextStyle(
        fontSize: 21.0,
      ),),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(PlatformAlertDialogAction(
        child: Text(cancelActionText),
        onPressed: () => Navigator.of(context).pop(false),
      )
      );
    }
      actions.add(PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onPressed: () => Navigator.of(context).pop(true),
      )
      );

  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  final Widget child;
  final VoidCallback onPressed;

  PlatformAlertDialogAction({this.child, this.onPressed});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
