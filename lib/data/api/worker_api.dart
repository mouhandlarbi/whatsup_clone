import 'package:flutter/services.dart';
import 'dart:convert';

class WorkerApi {
  WorkerApi();
  Future<List> getWorkersLocally() async {
    final assetBundle =
        await rootBundle.loadString('assets/local_data/workers.json');
    final body = json.decode(assetBundle);

    return body;
  }
}
