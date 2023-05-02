import '../../../config/helpers/context_helpers.dart';
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
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: context.width * 0.1),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
