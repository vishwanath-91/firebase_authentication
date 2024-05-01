import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_authentication/custom_colors/custom_colors.dart';
import 'package:rest_api_authentication/custom_widgets/custom_elevated_button.dart';
import 'package:rest_api_authentication/custom_widgets/custom_text_button.dart';
import 'package:rest_api_authentication/custom_widgets/custom_text_field.dart';
import 'package:rest_api_authentication/provider/auth_provider.dart';

class ApiAuthScreen extends StatelessWidget {
  const ApiAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(
      builder: (context, AuthProviders authProviders, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Api Auth Screen"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        CustomColors.buttonColor,
                        const Color.fromARGB(172, 221, 168, 214),
                        CustomColors.buttonColor,
                      ]),
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: CustomColors.primaryColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: CustomColors.buttonColor,
                          child: const Icon(
                            Icons.person,
                            size: 70,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (authProviders.authState == false)
                          CustomTextField(
                              labelText: "Name",
                              hintText: "Enter Name",
                              controller: TextEditingController(),
                              keyboardType: TextInputType.name,
                              prefixIcon: Icons.person,
                              onChanged: (String value) {}),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: "Email",
                          hintText: "Enter Email",
                          controller: TextEditingController(),
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.email,
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          controller: TextEditingController(),
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock,
                          onChanged: (String value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (authProviders.authState == false)
                          CustomTextField(
                            labelText: 'Confirm Password',
                            hintText: 'Enter Confirm Password',
                            controller: TextEditingController(),
                            keyboardType: TextInputType.visiblePassword,
                            prefixIcon: Icons.lock,
                            onChanged: (String value) {},
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomElevatedButton(
                          text: authProviders.authState == false
                              ? "SingUp"
                              : "SingIn",
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextButton(
                          text: authProviders.authState == false
                              ? "I Have already account"
                              : "create an account",
                          onPressed: () => authProviders.authStateChange(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
