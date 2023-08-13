import 'package:flutter/material.dart';

void showSnackBar(context, {required String text, double height = 100}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 2.0, color: Colors.black87), borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(0, 0, 0, height),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(text)),
      ),
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.transparent,
    elevation: 100,
    behavior: SnackBarBehavior.floating,
  ));
}
