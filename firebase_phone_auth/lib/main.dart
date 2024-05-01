import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth/provider/phone_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/auth_screen.dart';
import 'Screen/phone_auth_screen.dart';
import 'Utils/custom_colors.dart';
import 'Utils/keys.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          create: (context) => PhoneAuthProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: Keys.globalKey,
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: CustomColors.primaryColor),
          appBarTheme: const AppBarTheme().copyWith(
            color: CustomColors.primaryColor,
            titleTextStyle:
                const TextStyle(color: CustomColors.appBarTextColor),
          ),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            );
          } else if (settings.name == 'PhoneAuthScreen') {
            return MaterialPageRoute(
              builder: (context) => const PhoneAuthScreen(),
            );
          } else {
            return null;
          }
        },
      ),
    );
  }
}
