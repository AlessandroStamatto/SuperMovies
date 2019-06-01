import 'package:flutter/material.dart';
import 'package:super_movies/helpers/navi.dart';

alert(BuildContext context, String title, String msg,{Function callback}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(msg, style: TextStyle(fontSize: 18, color: Colors.red)),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              pop(context);
              if(callback != null) {
                callback();
              }
            },
          )
        ],
      );
    },
  );
}