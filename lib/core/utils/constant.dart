import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const primarycolor = Colors.blue;
const ScoundColor = Color(0xff05042C);
String emailAdimin = "consultme455@gmail.com";
String passwordAdmin = "000000";

Future<bool?> tost({
  required text,
  required ToastStae state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStae { succes, eror, waring }

Color chooseColor(ToastStae state) {
  Color? color;
  switch (state) {
    case ToastStae.succes:
      color = Colors.green;
      break;
    case ToastStae.eror:
      color = Colors.red;
      break;
    case ToastStae.waring:
      color = Colors.amber;
      break;
  }
  return color;
}
