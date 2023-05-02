import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../widgets/angular_calc.dart';
import '../widgets/derivative_calc.dart';
import '../widgets/newton_laws_calc.dart';

class AdvancedScreen extends StatefulWidget {
  const AdvancedScreen({super.key});

  @override
  State<AdvancedScreen> createState() => _AdvancedScreenState();
}

class _AdvancedScreenState extends State<AdvancedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightColor,
        title: const Text(
          "Advanced Calculations",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Constants.darkColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              NewtonLawsCalculator(),
              AngularCalculator(),
              DifferentiationCalculator(),
            ],
          ),
        ),
      ),
    );
  }
}
