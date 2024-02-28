import 'package:state_management/data/api/project_api.dart';
import 'package:state_management/data/model/project.dart';

//-------------------------------------project repository

class ProjectRepository {
  factory ProjectRepository() {
    return _projectRepository;
  }
  ProjectRepository._();
  static final ProjectRepository _projectRepository = ProjectRepository._();
  ProjectApi api = ProjectApi();

  Future<List<Project>> getProjects() async {
    var res = await api.getProjectsLocally();
    //List list = res.data['projects'];
    return res.map((e) => Project.fromMap(e)).toList();
  }
}
