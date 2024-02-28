import 'package:flutter/material.dart';
import 'package:state_management/data/model/project.dart';
import 'package:state_management/view/pages/project_detail_page.dart';

class RectangleSwiper extends StatelessWidget {
  const RectangleSwiper({
    super.key,
    required this.projects,
  });
  final List<Project> projects;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      //color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) {
          return RectangleCard(
            project: projects[index],
          );
        },
      ),
    );
  }
}

class RectangleCard extends StatelessWidget {
  const RectangleCard({super.key, required this.project});
  final Project project;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProjectDetailPage(project: project);
        }));
      },
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                //width: 200,
                //height: 120,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: AssetImage(project.thumbnail), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            //color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              project.name,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
