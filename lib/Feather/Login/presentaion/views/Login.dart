import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feather/Admin/presention/HomeLayOut/Home/Views/Home.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/HomeLayOut.dart';
import 'package:flutter_application_1/Feather/HomeLayOut/Presentation/views/widgets/Catroies/widgets/Logo.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginBloc.dart';
import 'package:flutter_application_1/Feather/Login/mangment/LoginState.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomButtonAuth%20.dart';
import 'package:flutter_application_1/Feather/Login/presentaion/Widgets/CustomTextForm.dart';
import 'package:flutter_application_1/Feather/Regiter/presentaion/views/Register.dart';

import 'package:flutter_application_1/core/utils/constant.dart';
import 'package:flutter_application_1/core/utils/sharedPresfrace.dart';
import 'package:flutter_application_1/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  static const String nameKey = "Login";

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LodingLoginState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ScafullLoginState) {
            CacheHealper.SavedData(key: "uid", value: state.uid);
            tost(text: "Scaffull Login ", state: ToastStae.succes);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeLayOut.nameKey, (route) => false);
          } else if (state is ErrorLoginState) {
            tost(text: "Error Pleas try Again", state: ToastStae.eror);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Logo(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Center(
                            child: Text(
                              'Login',
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
                            height: MediaQuery.of(context).size.height * 0.062,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          CustomTextForm(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            hinttext: "ُEnter Your Email",
                            mycontroller: email,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.052,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.002,
                          ),
                          CustomTextForm(
                            suffixIcon: IconButton(
                              onPressed: () {
                                LoginBloc.get(context).changepassWord();
                              },
                              icon: Icon(LoginBloc.get(context).icon),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            hinttext: "ُEnter Your password",
                            mycontroller: password,
                            validator: (val) {
                              if (val == "") {
                                print("Cant de empety");
                              }
                              return null;
                            },
                            obscureText: LoginBloc.get(context).obscureText,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : ScoundColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Container(
                            width: double.infinity,
                            child: CustomButtonAuth(
                              title: "login",
                              onPressed: () async {
                                if (email.text == emailAdimin &&
                                    password.text == passwordAdmin) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AdminHome(),
                                      ));
                                  tost(
                                      text: "Scafull login Admin",
                                      state: ToastStae.succes);
                                } else if (formkey.currentState!.validate()) {
                                  LoginBloc.get(context).loginUser(
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Redister.nameKey);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't Have An Account ? ",
                                  style: Styles.textStyle16.copyWith(
                                    color: Theme.of(context)
                                                .colorScheme
                                                .brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : ScoundColor,
                                  ),
                                ),
                                Text(
                                  "Register",
                                  style: Styles.textStyle14
                                      .copyWith(color: primarycolor),
                                ),
                              ],
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
