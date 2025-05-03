// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircularButtonWidget extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final void Function()? onPressed;

  const CircularButtonWidget(
      {super.key, this.icon, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: icon,
        ),
        if (title != null) _subtitle()
      ],
    );
  }

  Widget _subtitle() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        title!,
        style: const TextStyle(color: Colors.white),
      )
    ]);
  }
}