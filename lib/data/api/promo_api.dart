import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:state_management/data/model/promo.dart';

class PromosApi {
  static Future<List<Promo>> getUsersLocally(BuildContext context) async {
    //load json's file
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/local_data/promo.json');
    //String _configContent = await rootBandle.loadString("assets/config/main.json");
    final body = json.decode(data);

    return body.map<Promo>(Promo.fromJson).toList();
  }
}
