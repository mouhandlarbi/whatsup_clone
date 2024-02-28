import 'package:flutter/services.dart';
import 'dart:convert';

class ProjectApi {
  ProjectApi();
  Future<List> getProjectsLocally() async {
    final assetBundle =
        await rootBundle.loadString('assets/local_data/projects.json');
    final body = json.decode(assetBundle);

    return body;
  }
}
