import 'package:firebase_emil_pass_authentication/widgets/custom_elevatedButton.dart';
import 'package:firebase_emil_pass_authentication/widgets/custom_textbutton.dart';
import 'package:firebase_emil_pass_authentication/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class EmailPassScreen extends StatelessWidget {
  const EmailPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email/Password Authentication'),
      ),
      body: Consumer<AuthProviders>(
        builder: (BuildContext context, AuthProviders value, Widget? child) =>
            Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (value.authType == AuthType.signUp)
                  CustomTextField(
                    controller: value.userController,
                    iconData: Icons.people,
                    hintText: "User",
                  ),
                CustomTextField(
                  controller: value.emailController,
                  iconData: Icons.email,
                  hintText: "Email",
                ),
                CustomTextField(
                  controller: value.passWordController,
                  iconData: Icons.password,
                  hintText: "Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextButton(
                    title: value.authType == AuthType.signIn
                        ? "Create Account SignUp?"
                        : "I Have Already Account SignIn?",
                    onTap: () => value.setAuthType()),
                CustomElevatedButton(
                  onTap: () {},
                  title:
                      value.authType == AuthType.signIn ? 'SignIn' : 'SignUp',
                  iconData: Icons.done,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
