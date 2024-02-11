import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/login%20&%20registration/cubit/cubit.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/login%20&%20registration/login_component.dart';
import 'package:moton/shared/component.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:image_picker/image_picker.dart';

// ignore: non_constant_identifier_names
var email_controller = TextEditingController();
// ignore: non_constant_identifier_names
var password_controller1 = TextEditingController();
// ignore: non_constant_identifier_names
var password_controller2 = TextEditingController();
final GlobalKey<FormState> formkey = GlobalKey<FormState>();

// ignore: non_constant_identifier_names
String regexp_email =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
// ignore: non_constant_identifier_names
String regexp_pass =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
// ignore: non_constant_identifier_names
String regexp_serial_num = r'(^(?:[+0]9)?[0-9]{5,10}$)';
void validateAndSave() {
  final FormState? form = formkey.currentState;
  if (form!.validate()) {
    print('Form is valid');
  } else {
    print('Form is invalid');
  }
}

File? imagefile;
FocusNode focusNode = FocusNode();
Future pickImage() async {
  final image = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  if (image == null) return;
  final imageTemporary = File(image.path);
//final imagePermanent =await saveim(image.path);
  imagefile = imageTemporary;
  var bytes = await imageTemporary.readAsBytes();
  print(bytes.length);
}

// ignore: non_constant_identifier_names
Widget Registration3() => Expanded(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                labeltext(text: "رقم هوية اثبات الشحصية"),
                defualt_text_form_field(
                    controller: email_controller,
                    Type: TextInputType.number,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "Email must not be embty";
                      }
                      if (!RegExp(regexp_serial_num).hasMatch(value)) {
                        return "enter valid number";
                      }
                      return null;
                    },
                    hint: "اكتب رقم الهوية"),
                ///////////////////////////////////////////////
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defualt_button(
                        text: "تحميل صورة الهوية",
                        icon: Icons.attachment_rounded,
                        backgroundcolor_white: true,
                        function: pickImage),
                    const Text(
                      "*حجم الملف اقصي ٢ ميجا بايت",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),

                /////////////////////////////////////////////////////
                labeltext(text: "الرقم السري"),
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    LoginCubit cubit = LoginCubit.get(context);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defualt_text_form_field(
                            suffix: IconButton(
                                onPressed: () {
                                  cubit.ChangeVisiabilityregistration1();
                                },
                                icon: cubit.SuffixPasswordRegistration1),
                            controller: password_controller1,
                            ispassword: cubit.VisiablePassword1,
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
                            hint: "ادخل الرقم السري"),
                        ////////////////////////////////////////
                        labeltext(text: "تأكيد الرقم السري"),
                        defualt_text_form_field(
                            suffix: IconButton(
                                onPressed: () {
                                  cubit.ChangeVisiabilityregistration2();
                                },
                                icon: cubit.SuffixPasswordRegistration2),
                            controller: password_controller2,
                            ispassword: cubit.VisiablePassword2,
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
                            hint: "تأكيد الرقم السري"),
                      ],
                    );
                  },
                ),
                labeltext(text: "رقم الجوال"),

                IntlPhoneField(
                  showCountryFlag: true,
                  focusNode: focusNode,
                  autoValidate: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password must not be empty";
                    }

                    if (!RegExp(regexp_serial_num).hasMatch(value) ||
                        value.length < 10) {
                      return "enter valid password";
                    }

                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "*** **** *** ***",
                    contentPadding: const EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //languageCode: "AR",
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  initialCountryCode: 'EG',
                  style: const TextStyle(color: Colors.black),
                  onCountryChanged: (country) {
                    //print('Country changed to: ' + country.name);
                  },
                ),
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    return Next_forwardButton(
                        Next: "التالي",
                        Forward: "السابق",
                        NextFun: () {
                          if (formkey.currentState!.validate()) {
                            LoginCubit.get(context).changeindex(4);
                          }
                        },
                        ForwardFun: () {
                          LoginCubit.get(context).changeindex(2);
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
