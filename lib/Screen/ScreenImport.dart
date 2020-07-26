import 'package:cardlearnenglish/CustomWidget/DropDownBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ScreenImport extends StatefulWidget {
  @override
  _ScreenImportState createState() => _ScreenImportState();
}

class _ScreenImportState extends State<ScreenImport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                DropDownBtn(),
                DropDownBtn()
              ],
            ),
          ),
        ));
  }
}
