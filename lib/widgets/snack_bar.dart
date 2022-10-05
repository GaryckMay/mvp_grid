import 'package:flutter/material.dart';

void snackBar(BuildContext context,String txt,[bool err=false]) {
  final snackBar = SnackBar(
    content: Text(txt),
    backgroundColor: err?Colors.redAccent:Colors.black45,
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}