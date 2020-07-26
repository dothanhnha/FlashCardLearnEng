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
              color: Colors.grey,
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, int) {
                    return ListTile(
                      title: Text('Sister'),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DropDownBtnPainter extends CustomPainter {
  static double offsetBot = 4;
  static final painter4 = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.fill
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;

  static final triaglePainter = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;

  static final triagleInPainter = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.fill
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;

  TextSpan spanTitle;
  TextPainter painterTitle;
  TextSpan spanContent;
  TextPainter painterContent;

  String label;
  String content = 'sister';


  DropDownBtnPainter({this.label}) {
    spanContent = new TextSpan(
        style: new TextStyle(
            color: Colors.white,
            fontSize: 20),
        text: content);
    painterContent = new TextPainter(
        text: spanContent,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(0, 0, size.width, size.height - offsetBot),
            Radius.circular(5)),
        painter4);


    painterContent.layout();
    painterContent.paint(canvas, Offset((size.width - painterContent.width) / 2,
        (size.height - painterContent.height) / 2 - offsetBot));

    final icon = Icons.arrow_drop_down;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.white,
          fontFamily: icon.fontFamily,
        ));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width - textPainter.width,
            (size.height - textPainter.height) / 2 - offsetBot));

    canvas.drawPath(getTriagle(size), triaglePainter);
    canvas.drawPath(getTriagleIn(size), triagleInPainter);
  }

  Path getTriagle(Size size) {
    return Path()
      ..moveTo(20, size.height - offsetBot - 10)
      ..lineTo(10, size.height)
      ..lineTo(30, size.height)
      ..lineTo(20, size.height - offsetBot - 10);
  }

  Path getTriagleIn(Size size) {
    return Path()
      ..moveTo(20, size.height - offsetBot - 8)
      ..lineTo(12, size.height)
      ..lineTo(28, size.height)
      ..lineTo(20, size.height - offsetBot - 8);
  }


    @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
