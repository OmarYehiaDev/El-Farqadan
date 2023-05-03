import 'package:elfarqadan_app/app/models/sub_subject_model.dart';
import 'package:elfarqadan_app/app/views/orbital/orbital_screen.dart';
import 'package:elfarqadan_app/app/views/orbital/views/advanced_screen.dart';
import 'package:elfarqadan_app/app/views/orbital/views/vectors_screen.dart';
import 'package:elfarqadan_app/app/views/skills/views/research_papers_screen.dart';
import 'package:flutter/material.dart';
import '../models/research_model.dart';
import '../models/subject_model.dart';
import '../config/helpers/assets_manager.dart';
import '../views/skills/skills_screen.dart';

class Constants {
  static const Color darkColor = Color(0xFF000046);
  static const Color lightColor = Color(0xFF90C9D6);
  static const String linkPrefix = "https://drive.google.com/uc?export=view&id=";
  List<Research> researches = [
    Research(
      name: "ADCS",
      author: "Habiba M. Mahmoud",
      docID: "1oe3Vw4gLYDkalDlpAZjazXzEd9U26mI2",
    ),
    Research(
      name: "Tides and Water Levels",
      author: "",
      docID: "1dScGm62x6dMsSQh2FglbNsuVaKFbaWNN",
    ),
    Research(
      name: "Reflector Telescope",
      author: "Amany G. Roby",
      docID: "1D3mo0h-r1zmH6uGICV49sInAQv19XltP",
    ),
    Research(
      name: "MICROGRAVITY EFFECTS ON HUMAN HEALTH",
      author: "Habiba M. Mahmoud",
      docID: "1U4bGaPxEgnQ3rWaV2_HBuXVFjBwtWC9A",
    ),
    Research(
      name: "Subsystems of a CubeSat",
      author: "",
      docID: "1ig6yxApCLj2h4PrExSPRCxVt3E-VlXHA",
    ),
    Research(
      name: "The Outer planets of the solar system",
      author: "",
      docID: "1tV69oTk_5rL6A5VAMzdnqQ8vidjwlOPi",
    ),
    Research(
      name: "Conclusion of subsystems inside CubSat",
      author: "Amany G. Roby",
      docID: "1kxvkBy-EhRmu09yL_BTr8S_5yUMtvM9J",
    ),
    Research(
      name: "The Effect Of Space Environment on Satellite Systems",
      author: "Mohamed A. Ezzelregal",
      docID: "1_V9NXENvy_vgNunUbZSI7tR3GEqAEdcU",
    ),
  ];
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
      subSubjects: [
        SubSubject(
          name: "Vectors",
          screen: const VectorsScreen(),
          isAvailable: true,
        ),
        SubSubject(
          name: "Advanced Calculations",
          screen: const AdvancedScreen(),
          isAvailable: true,
        ),
        SubSubject(
          name: "Subject Materials",
          screen: const SizedBox(),
          isAvailable: false,
        ),
        SubSubject(
          name: "Projects",
          screen: const SizedBox(),
          isAvailable: false,
        ),
      ],
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
      screen: const SkillsScreen(),
      isAvailable: true,
      subSubjects: [
        SubSubject(
          name: "Research Papers",
          screen: const ResearchPapersScreen(),
          isAvailable: true,
        ),
        SubSubject(
          name: "Offline Events",
          screen: const SizedBox(),
          isAvailable: false,
        ),
        SubSubject(
          name: "Online Webinars",
          screen: const SizedBox(),
          isAvailable: false,
        ),
      ],
    ),
  ];
}
