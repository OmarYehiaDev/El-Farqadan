import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' hide Colors;

class SimpleVectorCalculator extends StatefulWidget {
  const SimpleVectorCalculator({super.key});

  @override
  State<SimpleVectorCalculator> createState() => _SimpleVectorCalculatorState();
}

class _SimpleVectorCalculatorState extends State<SimpleVectorCalculator> {
  TextEditingController vectorCtrl = TextEditingController();
  String absVal = "";
  List<String> thetas = [];

  void setToInitial() {
    setState(() {
      vectorCtrl.clear();
      absVal = "";
      thetas = [];
    });
  }

  void calcResult<T extends Vector>(vecA) {
    if (vecA is Vector2) {
      Vector2 xAxis = Vector2(1, 0);
      Vector2 yAxis = Vector2(0, 1);
      List<Vector2> axises = [xAxis, yAxis];
      List<double> degreeThetas = [];
      for (Vector2 axis in axises) {
        degreeThetas.add(degrees(vecA.angleTo(axis)));
      }

      setState(() {
        absVal = vecA.length.toStringAsFixed(2);
        thetas.clear();

        thetas.addAll(degreeThetas.map((e) => "${e.toStringAsFixed(2)}°").toList());
      });
    } else if (vecA is Vector3) {
      Vector3 xAxis = Vector3(1, 0, 0);
      Vector3 yAxis = Vector3(0, 1, 0);
      Vector3 zAxis = Vector3(0, 0, 1);
      List<Vector3> axises = [xAxis, yAxis, zAxis];
      List<double> degreeThetas = [];
      for (Vector3 axis in axises) {
        degreeThetas.add(degrees(vecA.angleTo(axis)));
      }

      setState(() {
        absVal = vecA.length.toStringAsFixed(2);
        thetas.clear();
        thetas.addAll(degreeThetas.map((e) => "${e.toStringAsFixed(2)}°").toList());
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Let's get some properties from the Vector V"),
        const Text("Enter components separated by comma ( , )"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Vector V"),
            SizedBox(
              width: context.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: vectorCtrl,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (vectorCtrl.text.isNotEmpty && thetas.isNotEmpty && absVal.isNotEmpty)
                IconButton(
                  onPressed: () {
                    setToInitial();
                  },
                  icon: const Icon(Icons.clear),
                ),
              OutlinedButton(
                onPressed: () {
                  dynamic vecV;
                  List<double> vectorV = [];
                  if (vectorCtrl.text.isNotEmpty) {
                    for (String element in vectorCtrl.text.split(",")) {
                      vectorV.add(double.parse(element));
                    }
                    if (vectorV.length == 3) {
                      vecV = Vector3.array(vectorV);
                      calcResult(vecV);
                    } else {
                      vecV = Vector2.array(vectorV);
                      calcResult(vecV);
                    }
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
            ],
          ),
        ),
        if (absVal.isNotEmpty && thetas.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("(Vector V)'s magnitude is $absVal"),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("And angles are:"),
                    SizedBox(
                      width: context.width * 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: thetas.map((e) => Text(e)).toList(),
                      ),
                    ),
                  ],
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
