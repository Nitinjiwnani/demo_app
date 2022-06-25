import 'dart:convert';

import 'package:demo_app/screens/show_dialog_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../Model/UserDataModel.dart';

var user_data = FutureBuilder(
  future: ReadJsonData(),
  builder: (context, data) {
    if (data.hasError) {
      return Center(child: Text("${data.error}"));
    } else if (data.hasData) {
      var items = data.data as List<UserDataModel>;
      return ListView.builder(
          itemCount: items == null ? 0 : items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  showDialogFunc(
                      context, items[index], items[index], items[index]);
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  items[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(items[index].atype.toString()),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ));
          });
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  },
);
Future<List<UserDataModel>> ReadJsonData() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('jsonfile/userlist.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => UserDataModel.fromJson(e)).toList();
}
