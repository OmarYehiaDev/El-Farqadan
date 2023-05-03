import 'package:flutter/material.dart';

class SubSubject {
  final String name;
  final Widget screen;
  final bool isAvailable;
  SubSubject({
    required this.name,
    required this.screen,
    this.isAvailable = false,
  });
}
