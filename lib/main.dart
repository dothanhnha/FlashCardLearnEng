import 'package:cardlearnenglish/Screen/ScreenImport.dart';
import 'package:flutter/material.dart';

import 'Screen/ScreenMain.dart';

void main() {
  runApp(CardLearnEnglish());
}
class CardLearnEnglish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenImport(),
    );
  }
}


