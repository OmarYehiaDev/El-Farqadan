import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';

class NewtonLawsCalculator extends StatefulWidget {
  const NewtonLawsCalculator({super.key});

  @override
  State<NewtonLawsCalculator> createState() => _NewtonLawsCalculatorState();
}

class _NewtonLawsCalculatorState extends State<NewtonLawsCalculator> {
  TextEditingController massCtrl = TextEditingController();
  TextEditingController accelerationCtrl = TextEditingController();
  String resultantForce = "";

  void setToInitial() {
    setState(() {
      massCtrl.clear();
      accelerationCtrl.clear();
      resultantForce = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Let's play with Force as per Newton's laws"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).add(
            const EdgeInsets.only(top: 8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  if (massCtrl.text.isNotEmpty &&
                      accelerationCtrl.text.isNotEmpty &&
                      double.parse(massCtrl.text) > 0) {
                    double acceleration = double.parse(accelerationCtrl.text);
                    double mass = double.parse(massCtrl.text);
                    setState(() {
                      resultantForce = (mass * acceleration).toStringAsFixed(2);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Enter missing values!!!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Calc"),
              ),
              SizedBox(
                width: context.width * 0.35,
                child: TextFormField(
                  controller: massCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Mass",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.width * 0.35,
                child: TextFormField(
                  controller: accelerationCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Acceleration",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (massCtrl.text.isNotEmpty &&
                  accelerationCtrl.text.isNotEmpty &&
                  resultantForce.isNotEmpty)
                IconButton(
                  onPressed: () {
                    setToInitial();
                  },
                  icon: const Icon(Icons.clear),
                ),
              const Text(
                "Resultant Force (F):",
                textAlign: TextAlign.center,
              ),
              Text(
                "$resultantForce N",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        if (resultantForce.isNotEmpty)
          Text(
            "And to clear the force you must apply F' = ${double.parse(resultantForce).isNegative ? double.parse(resultantForce).abs() : -double.parse(resultantForce)} N",
          ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Divider(
            endIndent: context.width * 0.3,
            indent: context.width * 0.3,
            height: 16,
            thickness: 1,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
