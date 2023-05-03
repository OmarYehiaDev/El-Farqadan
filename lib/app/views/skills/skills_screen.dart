import 'package:elfarqadan_app/app/components/coming_soon_screen.dart';
import 'package:elfarqadan_app/app/config/helpers/context_helpers.dart';
import 'package:elfarqadan_app/app/models/subject_model.dart';
import 'package:flutter/material.dart';

import '../../components/subtopic_tile.dart';
import '../../config/helpers/assets_manager.dart';
import '../../models/sub_subject_model.dart';
import 'views/research_papers_screen.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final Subject subject = Subject(
    name: "Skills",
    icon: AssetsManager.skills,
    screen: const SkillsScreen(),
    isAvailable: true,
    subSubjects: [
      SubSubject(
        name: "Research Papers",
        screen: const ResearchPapersScreen(),
        isAvailable: true,
      ),
      SubSubject(
        name: "Offline Events",
        screen: const SizedBox(),
        isAvailable: false,
      ),
      SubSubject(
        name: "Online Webinars",
        screen: const SizedBox(),
        isAvailable: false,
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        toolbarHeight: context.height * 0.1,
        title: Row(
          children: [
            Image.asset(
              subject.icon,
              width: context.width * 0.2,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(subject.name),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: ListView.builder(
          itemBuilder: (_, index) {
            SubSubject topic = subject.subSubjects[index];
            return SubTopicTile(
              title: topic.name,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => topic.isAvailable ? topic.screen : const ComingSoonScreen(),
                  ),
                );
              },
            );
          },
          itemCount: subject.subSubjects.length,
        ),
      ),
    );
  }
}
