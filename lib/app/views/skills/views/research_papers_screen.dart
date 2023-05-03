import 'package:elfarqadan_app/app/components/read_pdf_online.dart';
import 'package:elfarqadan_app/app/models/research_model.dart';
import 'package:flutter/material.dart';

import '../../../components/target_card.dart';
import '../../../config/constants.dart';

class ResearchPapersScreen extends StatefulWidget {
  const ResearchPapersScreen({super.key});

  @override
  State<ResearchPapersScreen> createState() => _ResearchPapersScreenState();
}

class _ResearchPapersScreenState extends State<ResearchPapersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Constants.darkColor,
        ),
        backgroundColor: Constants.lightColor,
        title: const Text(
          "Research Papers",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Constants.darkColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 16),
        child: ListView.builder(
          itemBuilder: (_, index) {
            Research research = Constants().researches[index];
            return TargetCard(
              name: research.name,
              author: research.author.isEmpty ? null : research.author,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReadPdfOnline(fileURL: Constants.linkPrefix + research.docID),
                  ),
                );
              },
            );
          },
          itemCount: Constants().researches.length,
        ),
      ),
    );
  }
}
