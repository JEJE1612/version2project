import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/Catroieus.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/chat.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/profail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBloc extends Cubit<MyState> {
  MyBloc() : super(InitalState());
  static MyBloc get(context) => BlocProvider.of(context);
  int currentindex = 0;

  List<Widget> views = [
    const CatroiesScreen(),
    const ChatScreen(),
    Profail(),
    const Setting(),
  ];

  void changeBootomSheet(int index) {
    currentindex = index;
    emit(ChangeBottonSheet());
  }

  ThemeMode themeMode = ThemeMode.light;
  void changeTheam(ThemeMode mode) {
    themeMode = mode;
    emit(ChangeTheamMode());
  }
}
