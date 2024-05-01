import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_authentication/custom_colors/custom_colors.dart';
import 'package:rest_api_authentication/provider/auth_provider.dart';
import 'package:rest_api_authentication/screen/api_auth_screen.dart';
import 'package:rest_api_authentication/screen/welcome_screen.dart';

import 'keys/keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            scaffoldMessengerKey: Keys.scaffoldMessengerKey,
            theme: ThemeData(
              useMaterial3: true,
              appBarTheme: const AppBarTheme().copyWith(
                color: CustomColors.appBarColor,
                titleTextStyle: TextStyle(
                  color: CustomColors.appBarTextColor,
                  fontSize: 24.0,
                ),
                iconTheme: IconThemeData(
                  color: CustomColors.appBarTextColor,
                ),
              ),
            ),
            onGenerateRoute: (settings) {
              if (settings.name == "/") {
                return MaterialPageRoute(
                  builder: (context) => const WelComeScreen(),
                );
              } else if (settings.name == "/api_auth_screen") {
                return MaterialPageRoute(
                  builder: (context) => const ApiAuthScreen(),
                );
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}
/*
*
* */
