import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ItemCategoryVocab extends StatelessWidget {
  String title;
  int numberVocab;
  int percent;


  ItemCategoryVocab(this.title, this.numberVocab, this.percent);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,

      child: CustomPaint(
        painter: ItemCategoryPainter(title,numberVocab,percent),
      ),
    );
  }
}

class ItemCategoryPainter extends CustomPainter {
  static final Color roundUnActive = Colors.red[200];
  static final Color roundActive = Colors.red;
  static final Color content = Colors.red[100];
  static final Color text = Colors.blue[800];
  static final Color back = Colors.white;

  final double roundPercentSmallerWhiteOut = 4;
  final double roundWhiteInSmallerPercent = 6;
  String title;
  int numberVocab;
  int percent;

  static final painter1 = Paint()
    ..color = roundActive
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;

  static final painter2 = Paint()
    ..color = roundUnActive
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;

  static final painter3 = Paint()
    ..color = back
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;

  static final painter4 = Paint()
    ..color = content
    ..strokeWidth = 4
    ..strokeCap = StrokeCap.round;

  TextSpan spanTitle;
  TextSpan spanNumberVocab;
  TextSpan spanPercent;
  TextPainter titlePainter;
  TextPainter numberVocabPainter;
  TextPainter percentPainter;

  ItemCategoryPainter(this.title, this.numberVocab, this.percent) {
    spanTitle = new TextSpan(
        style: new TextStyle(color: text, fontSize: 20), text: title);
    spanNumberVocab = new TextSpan(
        style: new TextStyle(color: text),
        text: numberVocab.toString() + " words");
    spanPercent = new TextSpan(
        style: new TextStyle(color: text, fontSize: 20),
        text: percent.toString() + '%');
    titlePainter = new TextPainter(
        text: spanTitle,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    numberVocabPainter = new TextPainter(
        text: spanNumberVocab,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    percentPainter = new TextPainter(
        text: spanPercent,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
  }

  @override
  void paint(Canvas canvas, Size size) {

    double radiusCircleWhiteOut = size.height / 2;
    Offset center =
        Offset(size.width - radiusCircleWhiteOut, radiusCircleWhiteOut);
    double radiusCirclePercent =
        radiusCircleWhiteOut - roundPercentSmallerWhiteOut;
    double radiusCircleWhiteIn =
        radiusCirclePercent - roundWhiteInSmallerPercent;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromPoints(Offset(0, 0),
                Offset(size.width - radiusCircleWhiteOut, size.height)),
            Radius.circular(10)),
        painter4);

    canvas.drawCircle(center, radiusCircleWhiteOut, painter3);
    canvas.drawCircle(center, radiusCirclePercent, painter2);

    canvas.drawArc(
        Rect.fromCenter(
            center: center,
            width: radiusCirclePercent * 2,
            height: radiusCirclePercent * 2),
        -math.pi / 2,
        2 * math.pi * percent / 100,
        true,
        painter1);
    canvas.drawCircle(center, radiusCircleWhiteIn, painter3);

    titlePainter.layout();
    titlePainter.paint(
        canvas, new Offset(10, (size.height / 2) - titlePainter.height / 2));

    titlePainter.layout();
    titlePainter.paint(
        canvas, new Offset(10, (size.height / 2) - titlePainter.height / 2));

    numberVocabPainter.layout();
    numberVocabPainter.paint(
        canvas,
        new Offset(
            size.width - radiusCircleWhiteOut * 2 - numberVocabPainter.width,
            size.height - numberVocabPainter.height - 5));

    percentPainter.layout();
    percentPainter.paint(
        canvas,
        new Offset(center.dx - percentPainter.width / 2,
            (size.height / 2) - percentPainter.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
