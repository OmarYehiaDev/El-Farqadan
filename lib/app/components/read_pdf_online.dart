import 'package:elfarqadan_app/app/config/constants.dart';
import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadPdfOnline extends StatelessWidget {
  final String fileURL;
  const ReadPdfOnline({
    super.key,
    required this.fileURL,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightColor,
      appBar: AppBar(
        backgroundColor: Constants.darkColor,
        leading: const BackButton(
          color: Constants.lightColor,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05).add(
          const EdgeInsets.only(top: 32, bottom: 24),
        ),
        child: SfPdfViewer.network(
          fileURL,
        ),
      ),
    );
  }
}
