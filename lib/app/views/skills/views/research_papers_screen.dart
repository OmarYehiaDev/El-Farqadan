import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference researchesRef = FirebaseFirestore.instance.collection("researches");
  Future<List<Research>> getResearches() async {
    var query = await researchesRef.orderBy("name").get();
    List<QueryDocumentSnapshot<dynamic>> rawData = query.docs;
    return rawData
        .map(
          (e) => Research.fromJson(
            e.data(),
          ),
        )
        .toList();
  }

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
        child: StreamBuilder<List<Research>>(
          stream: getResearches().asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              List<Research> researches = snapshot.data!;
              return ListView.builder(
                itemBuilder: (_, index) {
                  Research research = researches[index];
                  return TargetCard(
                    name: research.name,
                    author: research.author.isEmpty ? null : research.author,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReadPdfOnline(fileURL: research.url),
                        ),
                      );
                    },
                  );
                },
                itemCount: researches.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Constants.darkColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
