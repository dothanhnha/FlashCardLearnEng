import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                itemTextInput('Word'),
                itemTextInput('Type'),
                itemTextInput('Mean'),
                itemTextInput('Example'),
              ],
            ),
          ),
        ));
  }

  Widget itemTextInput(String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(label ,style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Expanded(
            flex: 8,
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
          ),
        ],
      ),
    );
  }
}
