import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownBtn extends StatefulWidget {
  @override
  _DropDownBtnState createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  bool dropped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          dropped = !dropped;
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: double.infinity,
            child: CustomPaint(
              painter: DropDownBtnPainter(),
            ),
          ),
          Visibility(
            visible: dropped,
            child: Container(
              height: 50,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}

class DropDownBtnPainter extends CustomPainter {
  static final painter4 = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;
  TextSpan spanTitle;
  TextPainter painterTitle;
  TextSpan spanContent;
  TextPainter painterContent;

  String label;
  String content = 'sister';


  DropDownBtnPainter({this.label}) {
    this.label = 'Word';
    spanTitle = new TextSpan(
        style: new TextStyle(
            color: Colors.grey,
            fontSize: 20,
            backgroundColor: Colors.grey[200]),
        text: label);
    painterTitle = new TextPainter(
        text: spanTitle,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);

    spanContent = new TextSpan(
        style: new TextStyle(
            color: Colors.grey,
            fontSize: 20,
            backgroundColor: Colors.grey[200]),
        text: content);
    painterContent = new TextPainter(
        text: spanContent,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
  }

  @override
  void paint(Canvas canvas, Size size) {
    painterTitle.layout();
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(0, painterTitle.height / 2, size.width, size.height),
            Radius.circular(5)),
        painter4);
    painterTitle.paint(canvas, new Offset(10, 0));

    painterContent.layout();
    painterContent.paint(canvas, Offset((size.width - painterContent.width) / 2,
        (size.height + painterTitle.height / 2 - painterContent.height) / 2));

    final icon = Icons.arrow_drop_down;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.grey,
          fontFamily: icon.fontFamily,
        ));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width - textPainter.width,
            (size.height + painterTitle.height / 2 - textPainter.height) / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
