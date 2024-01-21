// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBloc.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/ChatSceen/ChatDeatiles.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Editprofail.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class Profail extends StatelessWidget {
  static const String nameKey = "Profail";

  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  UserModel? model;
  Profail({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AdminBloc, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                        child: InkWell(
                          onTap: () {
                            // SocailBloc.get(context).getCover();
                          },
                          child: Container(
                            height: size.height * 0.23,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                AssetsData.backGroudprofail,
                              ),
                            )),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        child: InkWell(
                          onTap: () {
                            // SocailBloc.get(context).getImageProfail();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                color: Colors.white),
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                AssetsData.testImage,
                              ),
                              radius: 48,
                            ),
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
                                  const PopupMenuItem(
                                    value: 'Chat',
                                    child: Row(
                                      children: [
                                        Icon(Icons.chat),
                                        SizedBox(width: 5),
                                        Text('Chat'),
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
                                        builder: (context) => EditProfail(),
                                      ),
                                    );
                                  } else if (value == 'Chat') {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => chatDeatiles(),
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
                            "${model?.uid}",
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
