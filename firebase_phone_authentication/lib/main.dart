import 'package:firebase_phone_authentication/Screen/phone_auth_screen.dart';
import 'package:firebase_phone_authentication/Utils/keys.dart';
import 'package:firebase_phone_authentication/utils/custom_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Keys.globalKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
        appBarTheme: const AppBarTheme().copyWith(
          color: CustomColors.primaryColor,
          titleTextStyle: const TextStyle(color: CustomColors.appBarTextColor),
        ),
        useMaterial3: true,
      ),
      home: const PhoneAuthScreen(),
    );
  }
}
