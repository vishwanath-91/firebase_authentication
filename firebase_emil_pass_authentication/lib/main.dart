import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_emil_pass_authentication/keys/keys.dart';
import 'package:firebase_emil_pass_authentication/provider/auth_provider.dart';
import 'package:firebase_emil_pass_authentication/screen/auth_screen.dart';
import 'package:firebase_emil_pass_authentication/screen/email_pass_screen.dart';
import 'package:firebase_emil_pass_authentication/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          create: (BuildContext context) => AuthProviders(),
        ),
      ],
      builder: (BuildContext context, child) => MaterialApp(
        scaffoldMessengerKey: Keys.globalKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Email Password Authentication',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme:
              const AppBarTheme().copyWith(color: Colors.deepPurpleAccent),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            );
          } else if (settings.name == 'emailPassScreen') {
            return MaterialPageRoute(
              builder: (context) => const EmailPassScreen(),
            );
          } else if (settings.name == 'home') {
            return MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );
          } else {
            return null;
          }
        },
      ),
    );
  }
}
