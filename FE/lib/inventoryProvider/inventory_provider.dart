import 'dart:convert';

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
}
