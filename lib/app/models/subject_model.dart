import 'package:flutter/material.dart';

class Subject {
  final String name;
  final String icon;
  final Widget screen;
  final bool isAvailable;
  final List<Subject> subSubjects;
  Subject({
    required this.name,
    required this.icon,
    required this.screen,
    this.isAvailable = false,
    this.subSubjects = const <Subject>[],
  });
}
