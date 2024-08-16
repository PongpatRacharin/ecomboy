import 'dart:convert';

import 'package:ecomboy/api/inventory_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InventoryProvider with ChangeNotifier {
  Map<String, String> commonTrans = {};
  // get
  List<Map<String, dynamic>> _userList = [];
  List<Map<String, dynamic>> get userList => _userList;

  void triggerUpdate() {
    notifyListeners();
  }

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
      var results = await InventoryAPI().loginApi(username, password);
      return results;
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getUserAction() async {
    String _tag = "getUserAction";

    try {
      var results = await InventoryAPI().getUserApi();
      if (results['message'] == 'success') {
        _userList = results['data'];
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future<void> storePermission(String permission) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('permission', permission);
  }

  Future<void> clearPermission() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('permission');
  }
}
