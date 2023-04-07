import 'package:flutter/material.dart';
import '../models/subject_model.dart';
import '../config/helpers/assets_manager.dart';

class Constants {
  List<Subject> subjects = [
    Subject(
      name: "Astronautics",
      icon: AssetsManager.astronautics,
      screen: const SizedBox(),
    ),
    Subject(
      name: "High Speed Aerodynamics",
      icon: AssetsManager.aerodyanmics,
      screen: const SizedBox(),
    ),
    Subject(
      name: "Electronics",
      icon: AssetsManager.electronics,
      screen: const SizedBox(),
      isAvailable: true,
    ),
    Subject(
      name: "Orbital Mechanics",
      icon: AssetsManager.orbital,
      screen: const SizedBox(),
      isAvailable: true,
    ),
    Subject(
      name: "Mathematics",
      icon: AssetsManager.maths,
      screen: const SizedBox(),
    ),
    Subject(
      name: "Computer Programming",
      icon: AssetsManager.programming,
      screen: const SizedBox(),
      isAvailable: true,
    ),
    Subject(
      name: "Thermodynamics",
      icon: AssetsManager.thermodynamics,
      screen: const SizedBox(),
    ),
  ];
}
