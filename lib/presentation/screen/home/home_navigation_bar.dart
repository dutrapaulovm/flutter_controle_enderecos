import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  int currentIndex;
  final Function(int index) onTap;

  HomeNavigationBar({super.key, required this.onTap, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        onTap(value);
      },
      items: _itensNavigationBar(),
    );
  }

  List<BottomNavigationBarItem> _itensNavigationBar() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      const BottomNavigationBarItem(icon: Icon(Icons.info), label: "Sobre"),
    ];
  }
}
