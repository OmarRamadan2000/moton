import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/login%20&%20registration/cubit/cubit.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/login%20&%20registration/login_component.dart';
import 'package:moton/shared/component.dart';
import 'package:moton/shared/costant.dart';

// ignore: non_constant_identifier_names
var number_controller = TextEditingController();
// ignore: non_constant_identifier_names
String regexp_serial_num = r'(^(?:[+0]9)?[0-9]{5,10}$)';
final GlobalKey<FormState> formkey = GlobalKey<FormState>();
final FormState? form = formkey.currentState;
// ignore: non_constant_identifier_names
Widget Registration1() => Expanded(
    flex: 9,
    child: Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("رقم السجل الخاص بك"),
                const SizedBox(
                  height: 20,
                ),
                defualt_text_form_field(
                    controller: number_controller,
                    Type: TextInputType.number,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Number must not be empty";
                      }
                      if (!RegExp(regexp_serial_num).hasMatch(value)) {
                        return "enter valid number";
                      }
                      return null;
                    },
                    hint: "ادخل رقم السجل الخاص بك"),
                const SizedBox(
                  height: 20,
                ),
                defualt_button(
                    text: "تفعيل",
                    function: () {},
                    backgroundcolor_white: true),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "هل ليس لديك رقم سجل؟",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "تواصل معنا",
                          style: TextStyle(color: defaultcolor, fontSize: 13),
                        )),
                  ],
                ),
                SizedBox(
                  height: 240,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: BlocBuilder<LoginCubit, LoginStates>(
                      builder: (context, state) {
                        return Next_forwardButton(
                            Next: "Next",
                            Forward: "Forward",
                            NextFun: () {
                              if (formkey.currentState!.validate()) {
                                LoginCubit.get(context).changeindex(2);
                              }
                            },
                            ForwardFun: () {
                              LoginCubit.get(context).changeindex(0);
                            });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
