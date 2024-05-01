
import 'package:flutter/material.dart';

import '../Widgets/custom_text_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: const Center(
        child: Column(
          children: [
            CustomTextWidgets(labelText: "home"),
          ],
        ),
      ),
    );
  }
}
