import 'package:flutter/material.dart';
import 'package:moton/login%20&%20registration/login_Screen.dart';
import 'package:moton/shared/component.dart';

// ignore: camel_case_types
class Language_Screen extends StatelessWidget {
  const Language_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(children: [
              const Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage(
                    'matrial/icons/background screen.png',
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(0, -.4),
                child: CircleAvatar(
                  backgroundColor: (Colors.white),
                  radius: 55.0,
                  child: Image(
                    image: AssetImage('matrial/icons/logo.png'),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, 0),
                child: Text(
                  "اهلا بك في",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Align(
                  alignment: const Alignment(0, .15),
                  child: Text(
                    "اكاديمية موتون الدولية",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            ]),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: const Alignment(0, -.26),
                    child: Text(
                      "من فضلك قم بأختيار لغة الدخول",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                defualt_button(
                    text: "اللغة العربية",
                    backgroundcolor_white: true,
                    function: () {
                      navigateTo(context, login());
                    }),
                defualt_button(
                    text: "English",
                    backgroundcolor_white: false,
                    function: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
