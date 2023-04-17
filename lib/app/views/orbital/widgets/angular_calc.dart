import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';

class AngularCalculator extends StatefulWidget {
  const AngularCalculator({super.key});

  @override
  State<AngularCalculator> createState() => _AngularCalculatorState();
}

class _AngularCalculatorState extends State<AngularCalculator> {
  TextEditingController velocityCtrl = TextEditingController();
  TextEditingController radiusCtrl = TextEditingController();
  String angularVelocity = "";
  String angularAcceleration = "";

  void setToInitial() {
    setState(() {
      velocityCtrl.clear();
      radiusCtrl.clear();
      angularVelocity = "";
      angularAcceleration = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Let's calculate angular velocity & angular acceleration"),
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
                  if (velocityCtrl.text.isNotEmpty && radiusCtrl.text.isNotEmpty) {
                    double velocity = double.parse(velocityCtrl.text);
                    double radius = double.parse(radiusCtrl.text);
                    setState(() {
                      angularVelocity = (velocity / radius).toStringAsFixed(2);
                      angularAcceleration = ((velocity * velocity) / radius).toStringAsFixed(2);
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
                  controller: velocityCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Velocity",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.width * 0.35,
                child: TextFormField(
                  controller: radiusCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Radius",
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
              if (velocityCtrl.text.isNotEmpty &&
                  radiusCtrl.text.isNotEmpty &&
                  angularAcceleration.isNotEmpty &&
                  angularVelocity.isNotEmpty)
                IconButton(
                  onPressed: () {
                    setToInitial();
                  },
                  icon: const Icon(Icons.clear),
                ),
              Text(
                "Angular Velocity (ω)\n$angularVelocity",
                textAlign: TextAlign.center,
              ),
              Text(
                "Angular Acceleration (α)\n$angularAcceleration",
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
