import 'package:flutter/material.dart';

class MyTransition {
  BuildContext context;

  MyTransition({required this.context});

  Future<bool> push(Widget route) async {
    var value = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return route;
      }),
    );
    return true;
  }
}
