import 'package:elfarqadan_app/app/config/constants.dart';

import '../config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';

class SubTopicTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const SubTopicTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Constants.darkColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: context.width * 0.1, vertical: 8),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: context.width * 0.15),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Constants.lightColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
