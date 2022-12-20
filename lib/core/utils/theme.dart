import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;
  const MainLayout({Key? key, required this.body, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
