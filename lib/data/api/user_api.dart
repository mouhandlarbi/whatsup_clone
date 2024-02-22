import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:state_management/data/model/user.dart';

class UsersApi {
  static Future<List<User>> getUsersLocally(BuildContext context) async {
    //load json's file
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/local_data/users.json');
    //String _configContent = await rootBandle.loadString("assets/config/main.json");
    final body = json.decode(data);

    return body.map<User>(User.fromJson).toList();
  }
}
