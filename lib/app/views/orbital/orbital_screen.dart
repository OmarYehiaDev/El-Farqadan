import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:elfarqadan_app/app/views/orbital/widgets/angular_calc.dart';
import 'package:elfarqadan_app/app/views/orbital/widgets/derivative_calc.dart';
import 'package:flutter/material.dart';

import '../../config/enums.dart';
import '../../config/helpers/assets_manager.dart';
import 'widgets/vector_calc.dart';

class OrbitalScreen extends StatefulWidget {
  const OrbitalScreen({super.key});

  @override
  State<OrbitalScreen> createState() => _OrbitalScreenState();
}

class _OrbitalScreenState extends State<OrbitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: context.height * 0.1,
        title: Row(
          children: [
            Image.asset(
              AssetsManager.orbital,
              width: context.width * 0.2,
            ),
            const SizedBox(
              width: 16,
            ),
            const Text("Orbital Mechanics"),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16),
                child: Text(
                  "- What's it?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                "Orbital Mechanics or Astrodynamics is the application of Ballistics and Celestial Mechanics to the practical problems concerning the motion of rockets and other spacecrafts.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
                child: Text(
                  "Now, let's play\nwith some basics :\")",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            VectorCalculator(operation: Operation.add),
            VectorCalculator(operation: Operation.sub),
            VectorCalculator(operation: Operation.cross),
            VectorCalculator(operation: Operation.dot),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16, bottom: 16),
                child: Text(
                  "Great Job!\nLet's advance more!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            AngularCalculator(),
            DifferentiationCalculator(),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
