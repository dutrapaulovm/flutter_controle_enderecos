import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AppScaffold(
      {super.key,
      this.scaffoldKey,
      required this.title,
      required this.body,
      this.drawer,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: Text(title ?? "")),
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        body: body);
  }
}
