import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../config/helpers/assets_manager.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              AssetsManager.rocketLoader,
              width: context.width * 0.8,
            ),
            const SizedBox(height: 16),
            const Text(
              "Coming soon :\")",
              style: TextStyle(
                fontSize: 25,
                color: Colors.redAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
