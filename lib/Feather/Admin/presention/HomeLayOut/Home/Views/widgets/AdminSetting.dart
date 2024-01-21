import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/Home.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/SettingAdmi/CustomAppBarAdmin.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class AdminSetting extends StatelessWidget {
  const AdminSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomAppBarAbmin(
            title: "Setting",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminHome(),
                  ));
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "Theme",
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primarycolor, style: BorderStyle.solid),
            ),
            child: Row(
              children: [
                Text(
                    Theme.of(context).colorScheme.brightness == Brightness.dark
                        ? "Dark Theme"
                        : "Light Theme",
                    style: Styles.textStyle18),
                const Spacer(),
                PopupMenuButton<String>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Light',
                      child: Row(
                        children: [
                          Icon(
                            Icons.light_mode,
                            color: Theme.of(context).colorScheme.brightness ==
                                    Brightness.light
                                ? Colors.amber
                                : Colors.black,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            'Light Theme',
                            style: Styles.textStyle16,
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'Dark',
                      child: Row(
                        children: [
                          Icon(Icons.dark_mode),
                          SizedBox(width: 5),
                          Text('Dark Theme'),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 'Light') {
                      // MyBloc.get(context).changeTheam(ThemeMode.light);
                    } else if (value == 'Dark') {
                      //MyBloc.get(context).changeTheam(ThemeMode.dark);
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: CustomButton(
                onTap: () {},
                text: "LogOut",
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
