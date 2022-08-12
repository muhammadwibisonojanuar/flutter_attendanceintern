import 'package:flutter/cupertino.dart';

class TransitionPageRoute extends PageRouteBuilder {

  final Widget widget;
  TransitionPageRoute({this.widget}):super(
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secanimation,
          Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secanimation){
        return widget;
      });
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget widget;
  SlideLeftRoute({this.widget})
      : super(
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            textDirection: TextDirection.rtl,
            child: child,
          ),
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) {
        return widget;
      }
  );
}