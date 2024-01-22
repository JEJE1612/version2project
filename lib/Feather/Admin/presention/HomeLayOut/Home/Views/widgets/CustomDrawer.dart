import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/Feather/Admin/deleteuser/deleteuserscreen.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/DeleteCatroies/AddCatoies.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/DeleteCatroies/DeleteCatroies.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ProfailAdmin/ProfailAdmin.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ShowCatroies/ShowCatroies.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/clientmanagment/showAllclient.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/consultantMangment/ShowAllConsultant.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: const Duration(milliseconds: 500),
          width: _isCollapsed ? 300 : 74,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: Color(0xFF141414),
          ),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                CustomDrawerHeader(
                  isCollapsable: _isCollapsed,
                  model: AdminBloc.get(context).usermodel,
                ),
                const Divider(color: Colors.grey),
                //MangmentCatroies
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.note_add_outlined,
                  title: 'Add Catroies',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCatroies(),
                        ));
                  },
                ),

                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.visibility_outlined,
                  title: 'Show Catroes',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowCatroies(),
                        ));
                  },
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.delete_outline,
                  title: 'Delete Catroes',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeleteCatroies(),
                        ));
                  },
                ),

                const Divider(color: Colors.grey),

                //Mangment Consultant
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.supervised_user_circle_sharp,
                  title: 'Show Consultant',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowAllConaltant(),
                        ));
                  },
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.person_2_outlined,
                  title: 'Show User',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowAllClient(),
                        ));
                  },
                ),
                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.contact_support_outlined,
                  title: 'Contact Us',
                  infoCount: 0,
                ),

                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.delete_outline,
                  title: 'Delete ',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Deleteuserclient(),
                        ));
                  },
                ),

                const Divider(color: Colors.grey),

                CustomListTile(
                  isCollapsed: _isCollapsed,
                  icon: Icons.person_2_outlined,
                  title: 'Profail',
                  infoCount: 0,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfailAdmin(
                            model: AdminBloc.get(context).usermodel!,
                          ),
                        ));
                  },
                ),
                OwnerInfo(isCollapsed: _isCollapsed),
                Align(
                  alignment: _isCollapsed
                      ? Alignment.bottomRight
                      : Alignment.bottomCenter,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    icon: Icon(
                      _isCollapsed
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {
                      setState(() {
                        _isCollapsed = !_isCollapsed;
                      });
                    },
                  ),
                ),
              ]
                  .map(
                    (e) => Padding(
                      padding: e is Drawer
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(top: 10),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

// owner header
class CustomDrawerHeader extends StatelessWidget {
  final bool isCollapsable;

  CustomDrawerHeader({
    super.key,
    required this.isCollapsable,
    required this.model,
  });
  UserModel? model;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          OwnerAvatar(),
          if (isCollapsable) ...[
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "${model?.name}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// drawer list tile
class CustomListTile extends StatelessWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  final bool forwardIos;
  final int infoCount;
  final void Function()? onTap;

  const CustomListTile({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.title,
    this.forwardIos = false,
    required this.infoCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.all(10),
          width: isCollapsed ? 300 : 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge.count(
                count: infoCount,
                isLabelVisible: infoCount > 0,
                textStyle: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
                child: Icon(icon, color: Colors.white),
              ),
              if (isCollapsed) ...[
                const Expanded(
                  flex: 0,
                  child: SizedBox(width: 10),
                ),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                ),
                if (forwardIos)
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// owner info
class OwnerInfo extends StatelessWidget {
  final bool isCollapsed;

  const OwnerInfo({
    super.key,
    required this.isCollapsed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isCollapsed ? 74 : 100,
      width: double.infinity,
      padding: isCollapsed
          ? const EdgeInsets.symmetric(horizontal: 10)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isCollapsed
          ? IntrinsicHeight(
              child: Row(
                children: [
                  const Expanded(
                    child: OwnerAvatar(),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // name
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "ConsultantMe",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        // username
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '@gmail.com',
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const Expanded(
                  child: OwnerAvatar(),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class OwnerAvatar extends StatelessWidget {
  const OwnerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          color: primarycolor, borderRadius: BorderRadius.circular(50)),
      child: Text(
        "C",
        textAlign: TextAlign.center,
        style: Styles.textStyle36.copyWith(color: Colors.white),
      ),
    );
  }
}
