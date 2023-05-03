import 'package:elfarqadan_app/app/config/constants.dart';

import '../config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';

class TargetCard extends StatelessWidget {
  final String name;
  final String? author;
  final Widget? trailing;
  final Widget? leading;
  final void Function()? onTap;
  const TargetCard({
    super.key,
    required this.name,
    this.author,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Constants.lightColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: context.width * 0.05, vertical: 8),
        child: Align(
          alignment: Alignment.center,
          child: ListTile(
            leading: leading,
            trailing: trailing,
            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: context.width * 0.05),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Constants.darkColor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            subtitle: author != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Author: ",
                        children: [
                          TextSpan(
                            text: author!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Constants.darkColor,
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Constants.darkColor,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
