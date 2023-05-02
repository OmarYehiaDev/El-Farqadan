import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../../../config/enums.dart';
import '../widgets/simple_vector_calc.dart';
import '../widgets/vector_calc.dart';

class VectorsScreen extends StatefulWidget {
  const VectorsScreen({super.key});

  @override
  State<VectorsScreen> createState() => _VectorsScreenState();
}

class _VectorsScreenState extends State<VectorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightColor,
        title: const Text(
          "Vectors",
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
              VectorCalculator(operation: Operation.add),
              VectorCalculator(operation: Operation.sub),
              VectorCalculator(operation: Operation.cross),
              VectorCalculator(operation: Operation.dot),
              SimpleVectorCalculator(),
            ],
          ),
        ),
      ),
    );
  }
}
