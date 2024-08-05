import 'dart:convert';

import 'package:ecomboy/api/inventory_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InventoryProvider with ChangeNotifier {
  Map<String, String> commonTrans = {};

  Future<void> loadLanguage() async {
    final String jsonString =
        await rootBundle.loadString('assets/langs/common/en.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    commonTrans = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    notifyListeners();
  }

  Future loginAction(username, password) async {
    String _tag = "loginAction";
    try {
      var result = await InventoryAPI().loginApi(username, password);
      if (result['status'] == 'success') {}
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }
}
