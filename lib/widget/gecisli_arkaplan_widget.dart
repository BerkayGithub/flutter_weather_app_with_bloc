import 'package:flutter/material.dart';

class GecisliArkaplanWidget extends StatelessWidget {
  final MaterialColor renk;
  final Widget child;

  const GecisliArkaplanWidget({
    super.key,
    required this.renk,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [?renk[700], ?renk[500], ?renk[200]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1,0.5,1]
        ),
      ),
      child: child,
    );
  }
}
