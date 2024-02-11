import 'package:flutter/material.dart';
import 'package:moton/shared/costant.dart';

// ignore: non_constant_identifier_names
Widget defualt_button(
        {required String text,
        required Function()? function,
        IconData? icon,

        // ignore: non_constant_identifier_names
        required bool backgroundcolor_white}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      // ignore: sized_box_for_whitespace
      child: Container(
        width: double.infinity,
        height: 45,
        child: TextButton(
          onPressed: function,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor:
                  backgroundcolor_white ? Colors.white : defaultcolor,
              side: BorderSide(
                  color: backgroundcolor_white ? defaultcolor : Colors.white)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Icon(icon, color: defaultcolor) : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:
                          backgroundcolor_white ? defaultcolor : Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
/////////////////////////////////////////////////////////////////////////////////////
// ignore: non_constant_identifier_names
Widget defualt_text_form_field({
  required controller,
  // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
  required Type,
  // ignore: non_constant_identifier_names
  Function? on_Submit,
  String? hint,
  ispassword = false,
  Widget? prefix,
  Widget? suffix,
  bool readonly = false,
  // ignore: non_constant_identifier_names
  Function? suffix_pressed,
  // ignore: non_constant_identifier_names
  required String? Function(String?)? validate,
  Function()? ontap,
}) =>
    // ignore: sized_box_for_whitespace
    Column(
      children: [
        TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: controller,

          keyboardType: Type,
          // onFieldSubmitted: (s) {
          //  on_Submit!(s);
          // },
          validator: validate,
          readOnly: readonly,
          onTap: ontap,
          obscureText: ispassword,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: const EdgeInsets.all(15),
            suffixIcon: suffix,
            suffixIconColor: iconsColor,
            prefixIcon: prefix,
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
