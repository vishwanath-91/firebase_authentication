import 'package:firebase_emil_pass_authentication/widgets/custom_elevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    final authprovider = Provider.of<AuthProviders>(context, listen: false);
    if (mounted) authprovider.updateEmailVeriFicationState();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProviders>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => value.logOut(),
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: value.emailVerified == true
                    ? const Text("email verified")
                    : const Text("email not verified"),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomElevatedButton(
                iconData: Icons.password,
                title: "Reset Password",
                onTap: () => value.resetpassword(context),
              )
            ],
          ),
        );
      },
    );
  }
}
