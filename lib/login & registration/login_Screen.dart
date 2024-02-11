// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/login%20&%20registration/cubit/cubit.dart';
import 'package:moton/login%20&%20registration/cubit/states.dart';
import 'package:moton/login%20&%20registration/login_component.dart';

// ignore: must_be_immutable, camel_case_types
class login extends StatelessWidget {
  login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {},
        builder: (BuildContext context, LoginStates state) {
          LoginCubit cubit = LoginCubit.get(context);

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                  title: Align(
                alignment: const Alignment(.4, 0),
                child: Text(
                  cubit.title_bar[cubit.current_index],
                ),
              )),
              body: Column(
                children: [
                  logo_container(),
                  Builder(
                      builder: (context) => cubit.screens[cubit.current_index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
