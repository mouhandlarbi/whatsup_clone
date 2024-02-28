import 'package:flutter/material.dart';
import 'package:state_management/data/model/project.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.project,
  });
  final Project project;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project detail"),
      ),
      body: Center(
        child: Text(project.name),
      ),
    );
  }
}
