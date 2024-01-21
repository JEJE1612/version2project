import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/chat.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/profail.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/setting.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/views/Login.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/views/Register.dart';
import 'package:flutter_application_1/Feather/splach/presentaion/views/splash_view.dart';
import 'package:flutter_application_1/core/thems/Mytheam.dart';
import 'package:flutter_application_1/core/utils/MyBlocObserver.dart';
import 'package:flutter_application_1/core/utils/sharedPresfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyB3StQIjdMxZt-1WorB-GDzZ4doOjG1hbg",
              appId: "1:469912997265:android:97de68703e0502f4c61e30",
              messagingSenderId: "469912997265",
              projectId: "consultme-2be0e",
              storageBucket: "consultme-2be0e.appspot.com"))
      : await Firebase.initializeApp();

  await CacheHealper.init();
  var uid = CacheHealper.getData("uid", key: "uid");
  // Widget widget;
  // if (uid != null) {
  //   widget = HomeLayOut();
  // }else{
  //   widget =Login()
  // }

  runApp(const MyApp());

  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyBloc(),
        ),
        BlocProvider(
          create: (context) => AdminBloc()
            ..getUserData()
            ..getconsultant()
            ..getAllUser()
            ..getCaroies(),
        ),
      ],
      child: BlocConsumer<MyBloc, MyState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Consult_me ',
            debugShowCheckedModeBanner: false,
            home: const SplashView(),
            theme: MyThemData.lightThem,
            darkTheme: MyThemData.darkTheam,
            themeMode: MyBloc.get(context).themeMode,
            initialRoute: SplashView.nameKey,
            routes: {
              SplashView.nameKey: (_) => const SplashView(),
              Login.nameKey: (_) => Login(),
              HomeLayOut.nameKey: (_) => const HomeLayOut(),
              Redister.nameKey: (_) => Redister(),
              Profail.nameKey: (_) => Profail(),
              Setting.nameKey: (_) => Setting(),
              ChatScreen.nameKey: (_) => ChatScreen(),
            },
          );
        },
      ),
    );
  }
}
