import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayOut extends StatelessWidget {
  static const String nameKey = "HomeLayOut";

  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc = MyBloc.get(context);
        return Scaffold(
          body: bloc.views[bloc.currentindex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: bloc.currentindex,
              onTap: (value) {
                bloc.changeBootomSheet(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  label: "chat",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_2_outlined,
                    ),
                    label: "profail"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: "settings"),
              ]),
        );
      },
    );
  }
}
