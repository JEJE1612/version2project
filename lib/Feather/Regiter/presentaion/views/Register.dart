import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomButtonAuth%20.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomTextForm.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/Mangment/CreatAccoubtState.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/Mangment/creatAccountBloc.dart';
import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Redister extends StatelessWidget {
  static const String nameKey = "Redister";
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController namme = TextEditingController();
  TextEditingController phone = TextEditingController();
  var formkey = GlobalKey<FormState>();

  String? typeclient;
  Redister({super.key});
  bool values = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreatAccount(),
      child: BlocConsumer<CreatAccount, CratAccountState>(
        listener: (context, state) {
          if (state is CreatUserLodingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ScafullCreatUserState) {
            tost(text: "Scaffull Login ", state: ToastStae.succes);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeLayOut.nameKey, (route) => false);
          } else if (state is ErrorCrestLodingState) {
            tost(text: state.Error, state: ToastStae.eror);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios)),
                          const Logo(),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Sign Up',
                              style: Styles.textStyle36.copyWith(
                                color:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : ScoundColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.072,
                          ),
                          Text(
                            "Name",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            hinttext: "ُEnter Your name",
                            mycontroller: namme,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "Name Cant de empety",
                                    state: ToastStae.eror);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Text(
                            "Email",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            hinttext: "ُEnter Your Email",
                            mycontroller: email,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "Email Cant de empety",
                                    state: ToastStae.eror);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Text(
                            "Phone",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            hinttext: "ُEnter Your phone",
                            mycontroller: phone,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "Phone Cant de empety",
                                    state: ToastStae.eror);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Text(
                            "password",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.visiblePassword,
                            hinttext: "ُEnter Your password",
                            mycontroller: password,
                            validator: (val) {
                              if (val == "") {
                                tost(
                                    text: "password Cant de empety",
                                    state: ToastStae.eror);
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Text(
                            "type of user:",
                            style: Styles.textStyle18.copyWith(
                              color: Theme.of(context).colorScheme.brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : ScoundColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 20),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: RadioListTile(
                                    selected: values,
                                    title: Text(
                                      'consulting',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    value: 'consulting',
                                    onChanged: (value) {
                                      values = true;
                                      typeclient = "consulting";
                                      CreatAccount.get(context)
                                          .changeIsAdmin(typeclient!);
                                    },
                                    groupValue: typeclient,
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    selected: values,
                                    title: Text('client',
                                        style: TextStyle(color: Colors.black)),
                                    value: "client",
                                    groupValue: typeclient,
                                    onChanged: (value) {
                                      values = true;
                                      typeclient = value;
                                      CreatAccount.get(context)
                                          .changeIsAdmin(typeclient!);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.022,
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomButtonAuth(
                              title: "SignUp",
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                 
                                  CreatAccount.get(context).userRegister(
                                      email: email.text,
                                      password: password.text,
                                      phone: phone.text,
                                      name: namme.text,
                                      type: typeclient!);
                                }}
                              ,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
