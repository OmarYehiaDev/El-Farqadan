import 'package:elfarqadan_app/app/config/helpers/assets_manager.dart';
import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';

class AboutTeamScreen extends StatefulWidget {
  const AboutTeamScreen({super.key});

  @override
  State<AboutTeamScreen> createState() => _AboutTeamScreenState();
}

class _AboutTeamScreenState extends State<AboutTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: context.topPadding + context.height * 0.05,
            // ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: Offset(-10, 10),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: context.width * 0.25,
                  backgroundImage: const AssetImage(
                    AssetsManager.logo,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.035,
            ),
            const Text(
              "Al Farqadan | الفرقدان",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
