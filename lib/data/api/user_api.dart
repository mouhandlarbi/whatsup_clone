import 'package:flutter/services.dart';
import 'dart:convert';

class UserApi {
  UserApi();
  Future<List> getUsersLocally() async {
    final assetBundle =
        await rootBundle.loadString('assets/local_data/users.json');
    final body = json.decode(assetBundle);

    return body;
  }
}
