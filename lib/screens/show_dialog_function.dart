import 'package:flutter/material.dart';

showDialogFunc(context, name, id, atype) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Gender'),
            content: TextField(
              decoration: InputDecoration(hintText: 'Enter your gender'),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text('Submit'),
              )
            ],
          ));
}
