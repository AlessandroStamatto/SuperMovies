import 'package:flutter/material.dart';

push(BuildContext context, Widget page, {bool replacement = false}) {

  if (replacement) {
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return page;
    }));
  }

  return Navigator.push(context, MaterialPageRoute(builder: (context){
    return page;
  }));
}

pop<T extends Object>(context, [ T result ]) {
  Navigator.pop(context, result);
}