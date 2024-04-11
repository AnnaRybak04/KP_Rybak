import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Цей клас MultiplatformPage надає методи для створення сторінок, які адаптовані до різних платформ.
class MultiplatformPage {
  // Метод create створює сторінку з використанням відповідного типу сторінки залежно від платформи.
  static Page create({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) {
    // Якщо це веб-платформа, повертаємо сторінку без анімації.
    if (kIsWeb) {
      return NoAnimationPage(
        child: child,
        key: key,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
        restorationId: restorationId,
      );
    } else {
      // В іншому випадку повертаємо MaterialPage.
      return MaterialPage(
        child: child,
        key: key,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        name: name,
        arguments: arguments,
        restorationId: restorationId,
      );
    }
  }

  // Метод createPageWithSlideAnimation створює сторінку з анімацією зсуву.
  static CustomTransitionPage createPageWithSlideAnimation({
    required Widget child,
    Offset begin = const Offset(1, 0),
    LocalKey? key,
    String? name,
  }) {
    return CustomTransitionPage<void>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          kIsWeb
              ? child // Якщо це веб-платформа, анімацію не застосовуємо.
              : SlideTransition(
                  position: Tween<Offset>(
                    begin: begin,
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
    );
  }
}

// Клас NoAnimationPage визначає сторінку без анімації.
class NoAnimationPage<T> extends Page<T> {
  const NoAnimationPage({
    required this.child,
    this.maintainState = true,
    this.fullscreenDialog = false,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });
  final Widget child;
  final bool maintainState;
  final bool fullscreenDialog;

  @override
  Route<T> createRoute(BuildContext context) {
    return _NoAnimationRouteBuilder<T>(
      widget: child,
      settings: this,
    );
  }
}

// Клас _NoAnimationRouteBuilder визначає маршрут без анімації.
class _NoAnimationRouteBuilder<T> extends PageRouteBuilder<T> {
  _NoAnimationRouteBuilder({
    required this.widget,
    super.settings,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return child;
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
  final Widget widget;
}
