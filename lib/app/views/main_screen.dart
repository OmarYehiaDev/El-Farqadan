import 'dart:developer';

import 'package:elfarqadan_app/app/components/coming_soon_screen.dart';
import 'package:elfarqadan_app/app/config/constants.dart';
import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:elfarqadan_app/app/views/about_us_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import '../models/subject_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        log("REMOVING SPLASHSCREEN");
        FlutterNativeSplash.remove();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Al Farqadan | الفرقدان",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              log("About Team");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AboutTeamScreen(),
                ),
              );
            },
            icon: const Icon(
              CupertinoIcons.info,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemBuilder: (_, index) {
          Subject subject = Constants().subjects[index];
          return InkWell(
            onTap: () {
              //TODO: Impl. Screens
              if (subject.isAvailable) {
                log("${subject.name}'s data is available");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => subject.screen,
                  ),
                );
              } else {
                // Fluttertoast.showToast(
                //   msg: "This subject isn't available yet :\"(",
                //   toastLength: Toast.LENGTH_SHORT,
                //   gravity: ToastGravity.CENTER,
                //   backgroundColor: Colors.red,
                //   textColor: Colors.white,
                //   fontSize: 20.0,
                // );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ComingSoonScreen(),
                  ),
                );
              }
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: context.width * 0.1),
                child: ListTile(
                  leading: (index % 2) == 0 ? Image.asset(subject.icon) : null,
                  title: Text(
                    subject.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: ((index % 2) == 0) ? null : Image.asset(subject.icon),
                ),
              ),
            ),
          );
        },
        itemCount: Constants().subjects.length,
      ),
    );
  }
}
