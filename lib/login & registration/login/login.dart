import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/login%20&%20registration/cubit/cubit.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/login%20&%20registration/login_component.dart';
import 'package:moton/shared/component.dart';
import 'package:moton/shared/costant.dart';

// ignore: non_constant_identifier_names
var email_controller = TextEditingController();
// ignore: non_constant_identifier_names
var password_controller = TextEditingController();
final GlobalKey<FormState> formkey = GlobalKey<FormState>();

// ignore: non_constant_identifier_names
String regexp_email =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
// ignore: non_constant_identifier_names
String regexp_pass =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
void validateAndSave() {
  final FormState? form = formkey.currentState;
  if (form!.validate()) {
    print('Form is valid');
  } else {
    print('Form is invalid');
  }
}

// ignore: non_constant_identifier_names
Widget login_screen() => Expanded(
    flex: 9,
    child: Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("البريد الالكتروني"),
                const SizedBox(
                  height: 20,
                ),
                defualt_text_form_field(
                    controller: email_controller,
                    Type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Email must not be embty";
                      }

                      if (!RegExp(regexp_email).hasMatch(value)) {
                        return "enter valid email";
                      }

                      return null;
                    },
                    hint: "Example@gmail.com"),
                ///////////////////////////////////////////////////////////
                labeltext(text: "الرقم السري"),

                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    LoginCubit cubit = LoginCubit.get(context);
                    return defualt_text_form_field(
                        suffix: IconButton(
                            onPressed: () {
                              cubit.ChangeVisiabilityLogin();
                            },
                            icon: cubit.SuffixPassword),
                        controller: password_controller,
                        ispassword: cubit.VisiablePassword,
                        Type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "password must not be empty";
                          }

                          if (!RegExp(regexp_pass).hasMatch(value)) {
                            return "enter valid password";
                          }

                          return null;
                        },
                        hint: "ادخل الرقم السري");
                  },
                ),
                defualt_button(
                    text: "دخول",
                    function: validateAndSave,
                    backgroundcolor_white: false),
                const Center(
                  child: Text(
                    "هل نسيت كلمة السر؟",
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "هل ليس لديك حساب؟",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BlocBuilder<LoginCubit, LoginStates>(
                      builder: (context, state) {
                        return TextButton(
                            onPressed: () {
                              LoginCubit.get(context).changeindex(1);
                            },
                            child: Text(
                              "سجل الان   ",
                              style:
                                  TextStyle(color: defaultcolor, fontSize: 13),
                            ));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
