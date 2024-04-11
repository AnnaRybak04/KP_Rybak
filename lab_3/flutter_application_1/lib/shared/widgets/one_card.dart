import 'package:flutter/material.dart';

class OneCard extends StatefulWidget {
  const OneCard({
    super.key,
    required this.child,
    required this.shape,
    this.onTap,
  });

  final Widget child;
  final RoundedRectangleBorder shape;
  final Function()? onTap;

  @override
  State<OneCard> createState() => _OneCardState();
}

class _OneCardState extends State<OneCard> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationTweenTranslate;
  late Animation<double> animationTweenElevation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    animationTweenTranslate = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ).drive(Tween(begin: 0, end: 3));
    animationTweenElevation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ).drive(Tween(begin: 3, end: 5));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onTap == null) {
      return Card(
        shape: widget.shape,
        child: widget.child,
      );
    } else {
      return GestureDetector(
        onTap: widget.onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            animationController.forward();
          },
          onExit: (_) {
            animationController.reverse();
          },
          child: Transform.scale(
            scale: 1 + (animationTweenTranslate.value / 100),
            child: Transform.translate(
              offset: Offset(0, -animationTweenTranslate.value),
              child: Card(
                shape: widget.shape,
                elevation: animationTweenElevation.value,
                child: widget.child,
              ),
            ),
          ),
        ),
      );
    }
  }
}
