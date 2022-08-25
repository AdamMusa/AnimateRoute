// ignore_for_file: non_constant_identifier_names

import 'package:animate_routes/src/transitions_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'default_transitions.dart';

AnimatedRoute({required transition, required Widget screen}) {
  /// This basically takes the Nextscreen you would like to navigate to

  switch (transition) {
    case Transition.downToUp:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);

          var end = Offset.zero;

          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    case Transition.upToDown:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, -1.0);

          return SlideTransition(
              position: Tween<Offset>(
                begin: begin,
                end: Offset.zero,
              ).animate(animation),
              child: child);
        },
      );
    case Transition.rightToLeft:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
    case Transition.leftToRight:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      );
    case Transition.zoom:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      );
    case Transition.size:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          PageRoute? route;
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              route, context, animation, secondaryAnimation, child);
        },
      );
    case Transition.fadeIn:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );

    case Transition.rightToLeftWithFade:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(-1.0, 0.0),
                      ).animate(secondaryAnimation),
                      child: child)));
        },
      );
    case Transition.leftToRightWithFade:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(1.0, 0.0),
                  ).animate(secondaryAnimation),
                  child: child),
            ),
          );
        },
      );

    case Transition.fade:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          PageRoute? route;
          return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
              route, context, animation, secondaryAnimation, child);
        },
      );
     case Transition.cupertino:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
        
          return CupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: true,
            child: child,
          );
        },
      );
    case Transition.topLevel:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          PageRoute? route;
          return const ZoomPageTransitionsBuilder().buildTransitions(
              route, context, animation, secondaryAnimation, child);
        },
      );
    // case Transition.native:
    //   return PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) => page,
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       PageRoute? route;
    //       return const PageTransitionsTheme().buildTransitions(
    //           route!, context, animation, secondaryAnimation, child);
    //     },
    //   );
    case Transition.circularReveal:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CircularRevealTransition().buildTransitions(
              context, Curves.bounceIn, Alignment.center, animation, secondaryAnimation, child);
        },
      );
    default:
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      );
  }
}
