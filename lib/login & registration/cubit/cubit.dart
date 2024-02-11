import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/login%20&%20registration/login/login.dart';
import 'package:moton/login%20&%20registration/registration/otp.dart';
import 'package:moton/login%20&%20registration/registration/registration1.dart';
import 'package:moton/login%20&%20registration/registration/registration2.dart';
import 'package:moton/login%20&%20registration/registration/registration3.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  // ignore: unused_local_variable, non_constant_identifier_names
  int current_index = 0;
  // ignore: non_constant_identifier_names
  Icon SuffixPassword = const Icon(Ionicons.eye_off_outline);
  // ignore: non_constant_identifier_names
  Icon SuffixPasswordRegistration1 = const Icon(Ionicons.eye_off_outline);
  // ignore: non_constant_identifier_names
  Icon SuffixPasswordRegistration2 = const Icon(Ionicons.eye_off_outline);
  // ignore: non_constant_identifier_names
  bool VisiablePassword = true;
  // ignore: non_constant_identifier_names
  bool VisiablePassword1 = true;
  // ignore: non_constant_identifier_names
  bool VisiablePassword2 = true;
  // ignore: unused_local_variable
  String? selecte = "";
  var dateinput = TextEditingController();

  List<Widget> screens = [
    login_screen(),
    Registration1(),
    Registration2(),
    Registration3(),
    Registration4(),
  ];
  // ignore: non_constant_identifier_names, unused_local_variable
  List<String> title_bar = [
    "تسجيل الدخول",
    "إنشاء حساب جديد",
    "إنشاء حساب جديد",
    "إنشاء حساب جديد",
    "إنشاء حساب جديد",
  ];

  void changeindex(int index) {
    current_index = index;
    emit(LoginchangebottomExpandStates());
  }

  // ignore: non_constant_identifier_names
  void ChangeVisiabilityLogin() {
    SuffixPassword = VisiablePassword
        ? const Icon(Ionicons.eye_outline)
        : const Icon(Ionicons.eye_off_outline);
    VisiablePassword = !VisiablePassword;
    emit(LoginchangeVisiablePasswordStates());
  }

  // ignore: non_constant_identifier_names
  void ChangeVisiabilityregistration1() {
    SuffixPasswordRegistration1 = VisiablePassword1
        ? const Icon(Ionicons.eye_outline)
        : const Icon(Ionicons.eye_off_outline);
    VisiablePassword1 = !VisiablePassword1;
    emit(LoginchangeVisiablePasswordStates());
  }

  // ignore: non_constant_identifier_names
  void ChangeVisiabilityregistration2() {
    SuffixPasswordRegistration2 = VisiablePassword2
        ? const Icon(Ionicons.eye_outline)
        : const Icon(Ionicons.eye_off_outline);
    VisiablePassword2 = !VisiablePassword2;
    emit(LoginchangeVisiablePasswordStates());
  }

  void changedateinput(String date) {
    dateinput.text = date;
  }

  void changedragbutton(String selected) {
    selecte = selected;
  }
}
