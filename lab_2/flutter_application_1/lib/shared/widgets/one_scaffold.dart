import 'package:flutter/material.dart';

class OneScaffold extends StatelessWidget {
  const OneScaffold({super.key, required this.child, this.isCropped = true});
  final Widget child;
  final bool isCropped;

  @override
  Widget build(BuildContext context) {
    final double width = isCropped ? 1100 : double.infinity;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width,
          child: child,
        ),
      ),
    );
  }
}
