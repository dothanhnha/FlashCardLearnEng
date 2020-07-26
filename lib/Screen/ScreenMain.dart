import 'dart:io';


import 'package:cardlearnenglish/CustomWidget/ItemCategoryVocab.dart';
import 'package:cardlearnenglish/Model/DataScreenMain.dart';
import 'package:cardlearnenglish/Model/Vocabulary.dart';
import 'package:cardlearnenglish/Process/ProcessImport.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Model/CategoryVocab.dart';

class ScreenMain extends StatefulWidget {
  @override
  _ScreenMainState createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> with TickerProviderStateMixin {
  List<CategoryVocab> listCategory;
  DataScreenMain data;

  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;
  CurvedAnimation curve;
  bool isOpenPopupMenu = false;

  void openPopupMenu() {
    if (!isOpenPopupMenu) {
      _arrowAnimationController.forward();
      isOpenPopupMenu = true;
    }
  }

  void closePopupMenu() {
    if (isOpenPopupMenu) {
      _arrowAnimationController.reverse();
      isOpenPopupMenu = false;
    }
  }

  @override
  void initState() {
    data = DataScreenMain();
    data.init();

    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    curve = CurvedAnimation(
        parent: _arrowAnimationController, curve: Curves.elasticOut);
    _arrowAnimation =
        Tween(begin: Offset(-200, 0), end: Offset(0, 0)).animate(curve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: new BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  if (isOpenPopupMenu)
                    closePopupMenu();
                  else
                    openPopupMenu();
                },
              )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialogAddCategory();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: <Widget>[
            GestureDetector(
              onPanDown: (detail) {
                closePopupMenu();
              },
              child: Container(
                child: ListView.builder(
                  itemCount: data.listCategory.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ItemCategoryVocab(
                          data.listCategory[index].title,
                          data.listCategory[index].numberVocab,
                          data.listCategory[index].percentLearned),
                    );
                  },
                ),
              ),
            ),
            popupMenu()
          ],
        ));
  }

  Future<void> import() async {
    List<File> files = await FilePicker.getMultiFile(
        type: FileType.custom,
        allowedExtensions: ['txt'],
        onFileLoading: (status) {});
    files[0].readAsString().then((value){
      ProcessImport processImport = ProcessImport(content: value);
      List<Vocabulary> list = processImport.getListVocabulary();
    });
  }

  Widget itemPopupMenu({String icon, String title, void Function() onTap}) {
    return FlatButton(
      onPressed: () {
        if (!isOpenPopupMenu) return;
        closePopupMenu();
        onTap();
      },
      child: Row(
        children: <Widget>[
          Image.asset(
            icon,
            width: 30,
            height: 30,
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget popupMenu() {
    return Positioned(
        bottom: 0,
        left: 0,
        child: AnimatedBuilder(
          animation: curve,
          builder: (context, child) => Transform.translate(
              offset: _arrowAnimation.value,
              child: Material(
                elevation: 20,
                child: Container(
                    width: 150,
                    padding: EdgeInsets.all(0),
                    color: Colors.grey[200],
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      children: ListTile.divideTiles(
                        context: context,
                        tiles: [
                          itemPopupMenu(
                              icon: 'assets/images/import_icon.png',
                              title: 'Import',
                              onTap: () {
                                import();
                              }),
                          itemPopupMenu(
                              icon: 'assets/images/export_icon.png',
                              title: 'Export',
                              onTap: () {}),
                          itemPopupMenu(
                              icon: 'assets/images/setting_icon.png',
                              title: 'Setting',
                              onTap: () {}),
                        ],
                      ).toList(),
                    )),
              )),
        ));
  }

  void showDialogAddCategory() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Material Dialog"),
              content: EditableText(
                controller: TextEditingController(),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
