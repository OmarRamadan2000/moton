import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/login%20&%20registration/cubit/cubit.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/login%20&%20registration/login_component.dart';
import 'package:moton/shared/costant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: non_constant_identifier_names
var number_controller = TextEditingController();

// ignore: non_constant_identifier_names
Widget Registration4() => Expanded(
      flex: 9,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      backgroundImage: AssetImage("matrial/phone avatar.png"),
                    ),
                    const Text(
                      "تأكيد رقم الجوال",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "لقد ارسلنا لك رمز التحقق الي رقم الجوال المسجل",
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginCubit, LoginStates>(
                      builder: (context, state) {
                        return Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinCodeTextField(
                            keyboardType: TextInputType.phone,
                            errorTextDirection: TextDirection.rtl,
                            textStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            cursorColor: defaultcolor,
                            appContext: context,
                            length: 4,
                            onChanged: (value) {
                              // ignore: avoid_print
                              print(value);
                            },
                            pinTheme: PinTheme(
                                fieldHeight: 60,
                                fieldWidth: 50,
                                selectedColor: defaultcolor,
                                activeColor: Colors.black,
                                inactiveColor: defaultcolor),
                            animationType: AnimationType.fade,
                            autoFocus: true,
                          ),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocBuilder<LoginCubit, LoginStates>(
                    builder: (context, state) {
                      return Next_forwardButton(
                          Next: "تسجيل",
                          Forward: "السابق",
                          NextFun: () {
                            LoginCubit.get(context).changeindex(2);
                          },
                          ForwardFun: () {
                            LoginCubit.get(context).changeindex(0);
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
