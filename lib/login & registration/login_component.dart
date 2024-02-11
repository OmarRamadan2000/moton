import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/login%20&%20registration/cubit/cubit.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/shared/costant.dart';

// ignore: non_constant_identifier_names
Widget logo_container() => Expanded(
      flex: 2,
      child: Container(
        color: defaultcolor,
        child: Stack(
          children: [
            const Align(
              alignment: FractionalOffset.topCenter,
              child: CircleAvatar(
                backgroundColor: (Colors.white),
                radius: 42.0,
                child: Image(
                  image: AssetImage('matrial/logo/logo.png'),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 1.1),
              child: Container(
                height: 20,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            )
          ],
        ),
      ),
    );

// ignore: non_constant_identifier_names
Widget Next_forwardButton({
  // ignore: non_constant_identifier_names
  required String Next,
  // ignore: non_constant_identifier_names
  required String Forward,
  // ignore: non_constant_identifier_names
  required Function()? NextFun,
  // ignore: non_constant_identifier_names
  required Function()? ForwardFun,
  // ignore: non_constant_identifier_names
}) =>
    // ignore: sized_box_for_whitespace
    Container(
      width: double.infinity,
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextButton(
                onPressed: NextFun,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: defaultcolor,
                ),
                child: Text(Next,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: TextButton(
                onPressed: ForwardFun,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: darkcolor,
                ),
                child: Text(Forward,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
Widget labeltext({required String text}) => Column(
      children: [
        Text(text),
        const SizedBox(
          height: 20,
        )
      ],
    );

Widget dropdwonButton({
  required List items,
  required String hint,
  required String? Function(String?)? validator,
  //required String? Function(String?)? validate,
}) =>
    Column(
      children: [
        BlocBuilder<LoginCubit, LoginStates>(
          builder: (context, state) {
            return DropdownButtonFormField<String>(
                validator: validator,
                //value: LoginCubit.get(context).selecte,
                decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: const EdgeInsets.all(15),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                //validator: ,

                items: items
                    // ignore: sort_child_properties_last
                    .map((e) =>
                        // ignore: sort_child_properties_last
                        DropdownMenuItem<String>(child: Text(e), value: e))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    LoginCubit.get(context).changedragbutton(value);
                    print(LoginCubit.get(context).selecte);
                  }
                  return;
                });
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
