import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myBloc.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/mangment/myState.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Widgets/CustomButton.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Setting/views/Widgets/CustomTextFoemaFaildEditProfail.dart';
import 'package:flutter_application_1/core/utils/assets.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfail extends StatefulWidget {
  const EditProfail({super.key});

  @override
  State<EditProfail> createState() => _EditProfailState();
}

class _EditProfailState extends State<EditProfail> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController jodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MyBloc, MyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                              ),
                            ),
                            Text(
                              "Edit Profile",
                              style: Styles.textStyle18,
                            ),
                          ],
                        ),
                      ],
                    ),
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
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomTextFoemaFaildEditProfail(
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      nameController: nameController,
                      onSaved: (value) {
                        nameController.text == value;
                      },
                      text: 'Pleas enter name',
                      hintText: "Name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFoemaFaildEditProfail(
                      prefixIcon: const Icon(
                        Icons.enhance_photo_translate_rounded,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      nameController: jodController,
                      onSaved: (value) {
                        nameController.text == value;
                      },
                      text: 'Pleas enter Job',
                      hintText: "Job ",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFoemaFaildEditProfail(
                      prefixIcon: const Icon(
                        Icons.horizontal_rule_rounded,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      nameController: bioController,
                      onSaved: (value) {
                        nameController.text == value;
                      },
                      text: 'Pleas enter Jod',
                      hintText: "BIO ",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFoemaFaildEditProfail(
                      prefixIcon: const Icon(
                        Icons.phone,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      nameController: phoneController,
                      onSaved: (value) {
                        nameController.text == value;
                      },
                      text: 'Pleas enter Jod',
                      hintText: "01010657674 ",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () {
                        // SocailBloc.get(context).udateUserData(
                        //   name: nameController.text,
                        //   phone: phoneController.text,
                        //   bio: bioController.text,
                        // );
                      },
                      text: "Save",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
