import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/login%20&%20registration/cubit/cubit.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/login%20&%20registration/login_component.dart';
import 'package:moton/shared/component.dart';
import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
var name_ar_controller = TextEditingController();

// ignore: non_constant_identifier_names
var name_en_controller = TextEditingController();

// ignore: non_constant_identifier_names
var email_controller = TextEditingController();
// ignore: non_constant_identifier_names

// ignore: non_constant_identifier_names
List items_sex = ["ذكر", "انثي"];
// ignore: non_constant_identifier_names
List items_nationality = ["مصري", "فلسطيني", "كويتي", "عراقي", "سعودي"];
// ignore: non_constant_identifier_names
final GlobalKey<FormState> formkey = GlobalKey<FormState>();
// ignore: non_constant_identifier_names
String regexp_email =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
// ignore: non_constant_identifier_names
String regexp_name_en = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";

// ignore: non_constant_identifier_names
String regexp_name_ar = r"^[\u0600-\u06FF\s]+$";
// ignore: non_constant_identifier_names
Widget Registration2() => Expanded(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                labeltext(text: "الاسم بالكامل عربي"),
                defualt_text_form_field(
                    controller: name_ar_controller,
                    Type: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "name must not be empty";
                      }
                      if (!RegExp(regexp_name_ar).hasMatch(value)) {
                        return "enter valid name";
                      }

                      return null;
                    },
                    hint: "اكتب الاسم بالكامل عربي"),
                labeltext(text: "الاسم بالكامل انجليزي"),
                defualt_text_form_field(
                    controller: name_en_controller,
                    Type: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "name must not be empty";
                      }
                      if (!RegExp(regexp_name_en).hasMatch(value)) {
                        return "enter valid name";
                      }
                      return null;
                    },
                    hint: "اكتب الاسم بالكامل انجليزي"),
                labeltext(text: "البريد الالكتروني"),
                defualt_text_form_field(
                    controller: email_controller,
                    Type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return "name must not be empty";
                      }
                      if (!RegExp(regexp_email).hasMatch(value)) {
                        return "enter valid email";
                      }

                      return null;
                    },
                    hint: "اكتب البريد الالكتروني"),
                /////////////////////////////////////////////////
                labeltext(text: "الجنسية"),
                dropdwonButton(
                    items: items_nationality,
                    hint: "اختر الجنسية",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a location';
                      }

                      return null;
                    }),
                /////////////////////////////////////////////////////
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    return labeltext(text: "تاريخ الميلاد");
                  },
                ),
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    return defualt_text_form_field(
                        readonly: true,
                        suffix: const Icon(Icons.date_range_rounded),
                        ontap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                            // ignore: use_build_context_synchronously
                            LoginCubit.get(context)
                                .changedateinput(formattedDate);
                          } else {
                            print("Date is not selected");
                          }
                        },
                        controller: LoginCubit.get(context).dateinput,
                        Type: TextInputType.datetime,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "name must not be empty";
                          }
                          return null;
                        },
                        hint: "اختر تاريخ الميلالد");
                  },
                ),
                /////////////////////////////////////////////////////////
                labeltext(text: "الجنس"),
                dropdwonButton(
                  items: items_sex,
                  hint: "اختر الجنس",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a location';
                    }

                    return null;
                  },
                ),
                ////////////////////////////////////////////////////////////
                BlocBuilder<LoginCubit, LoginStates>(
                  builder: (context, state) {
                    return Next_forwardButton(
                        Next: "التالي",
                        Forward: "السابق",
                        NextFun: () {
                          if (formkey.currentState!.validate()) {
                            LoginCubit.get(context).changeindex(3);
                          }
                        },
                        ForwardFun: () {
                          LoginCubit.get(context).changeindex(1);
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
