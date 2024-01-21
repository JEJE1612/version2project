// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/widgets/ProfailAdmin/EditProfailAdmin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Editprofail.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class ProfailAdmin extends StatelessWidget {
  static const String nameKey = "Profail";

  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  UserModel? model;
  ProfailAdmin({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = AdminBloc.get(context).usermodel;
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomLeft,
                    children: [
                      Card(
                        clipBehavior: Clip.none,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        elevation: 0.0,
                        child: Container(
                          height: size.height * 0.23,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  "${model?.cover}",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.white),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "${model?.image}",
                            ),
                            radius: 48,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Row(
                          children: [
                            const SizedBox(width: 5),
                            Material(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50),
                              child: PopupMenuButton<String>(
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 'update',
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit),
                                        SizedBox(width: 5),
                                        Text('Edit profail'),
                                      ],
                                    ),
                                  ),
                                ],
                                onSelected: (value) {
                                  // Handle selection here
                                  if (value == 'update') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfailAdmin(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${model?.name}",
                          style: Styles.textStyle18,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "${model?.bio}",
                            style:
                                Styles.textStyle14.copyWith(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              "${model?.phone}",
                              style: Styles.textStyle14
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
