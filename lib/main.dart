import 'package:flutter/material.dart';
import 'package:moton/features/Home/presentation/pages/home.dart';
import 'package:moton/shared/cache_helper.dart';
import 'package:moton/shared/costant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moton/shared/utils/blocObserver.dart';

import 'bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
  await cache.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: iconsColor),
        scaffoldBackgroundColor: defaultcolor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: defaultcolor,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSeed(seedColor: defaultcolor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
    );
  }
}
