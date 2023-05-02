import 'package:elfarqadan_app/app/views/orbital/orbital_screen.dart';
import 'package:flutter/material.dart';
import '../models/subject_model.dart';
import '../config/helpers/assets_manager.dart';

class Constants {
  static const Color darkColor = Color(0xFF000046);
  static const Color lightColor = Color(0xFF90C9D6);
  String teamPhone = "+201065189050";
  String teamMail = "Al.Farqadan.Team.com@gmail.com";
  String vision =
      "Al-Farqadan’s vision is: Achieving the Sustainable Development Goals (Egypt Vision 2030); to support Egypt’s efforts towards achieving a comprehensive development goals for a sustainable and successful educational sector throughout The Republic by providing a stimulating climate for the localization and knowledge production of our fellow students.";
  String goal =
      "The goal of Al-Farqadan is: Reaching our great Egypt to the highest ranks of Nations and bringing about a societal renaissance by teaching ourselves and our peers students good and useful science and applying that science in practical applications and applying it that benefits the country and individuals.";
  List<String> members = [
    "Mohamed A. Ezzelregal",
    "Ahmed M. Ibn ElKhattab",
    "Amany G. Roby",
    "Omar Y. Tawfeek",
    "Alaa-Eldin M. Alaa-Eldin",
    "Habiba M. Mahmoud",
    "Noha F. Hassan",
    "Manar A. Moahmed",
    "Nada M. Farouk",
  ];
  List<Subject> subjects = [
    Subject(
      name: "Orbital Mechanics",
      icon: AssetsManager.orbital,
      screen: const OrbitalScreen(),
      isAvailable: true,
    ),
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
    ),
    Subject(
      name: "Thermodynamics",
      icon: AssetsManager.thermodynamics,
      screen: const SizedBox(),
    ),
    Subject(
      name: "Space Technology",
      icon: AssetsManager.rocket,
      screen: const SizedBox(),
    ),
    Subject(
      name: "Skills",
      icon: AssetsManager.skills,
      screen: const SizedBox(),
    ),
  ];
}
