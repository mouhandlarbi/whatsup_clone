import 'dart:convert';
import 'package:flutter/services.dart';

class BusinessApi {
  BusinessApi();
  Future<List> getBusinesssLocally() async {
    final assetBundle =
        await rootBundle.loadString('assets/local_data/business.json');
    final body = json.decode(assetBundle);
    return body;
  }
}
