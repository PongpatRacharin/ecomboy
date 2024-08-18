import 'dart:convert';

import 'package:ecomboy/api/inventory_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InventoryProvider with ChangeNotifier {
  // lang
  Map<String, String> commonTrans = {};
  // var
  String username = "";
  String permission = "";
  // get
  List<Map<String, dynamic>> _userList = [];
  List<Map<String, dynamic>> get userList => _userList;
  Map<String, dynamic> _userByUserName = {};
  Map<String, dynamic> get userByUserName => _userByUserName;
  List<Map<String, dynamic>> _itemList = [];
  List<Map<String, dynamic>> get itemList => _itemList;
  Map<String, dynamic> _itemByCode = {};
  Map<String, dynamic> get itemByCode => _itemByCode;
  List<Map<String, dynamic>> _bestSell = [];
  List<Map<String, dynamic>> get bestSell => _bestSell;
  List<Map<String, dynamic>> _sellRecord = [];
  List<Map<String, dynamic>> get sellRecord => _sellRecord;
  Map<String, dynamic> _itemFaq = {};
  Map<String, dynamic> get itemFaq => _itemFaq;
  List<Map<String, dynamic>> _landingBestSell = [];
  List<Map<String, dynamic>> get landingBestSell => _landingBestSell;
  List<Map<String, dynamic>> _landingItem = [];
  List<Map<String, dynamic>> get landingItem => _landingItem;

  InventoryProvider() {
    loadStoreValue();
    triggerUpdate();
  }

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
        _userList = List<Map<String, dynamic>>.from(results['data']);
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getUserByUserNameAction(String username) async {
    String _tag = "getUserByUserNameAction";

    try {
      var results = await InventoryAPI().getUserByUsernameApi(username);
      if (results['message'] == 'success') {
        _userByUserName = results['data'];
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future updateUserDataAction(Map<String, dynamic> data) async {
    String _tag = "updateUserDataAction";

    try {
      var results = await InventoryAPI().updateUserApi(data);
      if (results['message'] == 'success') {
        debugPrint("update success");
        return results['message'];
      }
    } catch (e) {
      debugPrint("$_tag: $e");
      return 'error';
    }
  }

  Future createUserDataAction(Map<String, dynamic> data) async {
    String _tag = "createUserDataAction";

    try {
      var results = await InventoryAPI().saveUserApi(data);
      if (results['message'] == 'success') {
        debugPrint("create success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future deleteUserAction(String id) async {
    String _tag = "deleteUserAction";

    try {
      var results = await InventoryAPI().deleteUserApi(id);
      if (results['message'] == 'success') {
        debugPrint("delete success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getItemListAction() async {
    String _tag = "getItemListAction";

    try {
      var results = await InventoryAPI().getItemApi();
      if (results['message'] == 'success') {
        _itemList = List<Map<String, dynamic>>.from(results['data']);
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getItemByCodeAction(String itemcode) async {
    String _tag = "getItemByCodeAction";

    try {
      var results = await InventoryAPI().getItemByCodeApi(itemcode);
      if (results['message'] == 'success') {
        _itemByCode = results['data'];
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future updateItemDataAction(Map<String, dynamic> data) async {
    String _tag = "updateItemDataAction";

    try {
      var results = await InventoryAPI().updateItemApi(data);
      if (results['message'] == 'success') {
        debugPrint("update item success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future createItemDataAction(Map<String, dynamic> data) async {
    String _tag = "createItemDataAction";

    try {
      var results = await InventoryAPI().addItemApi(data);
      if (results['message'] == 'success') {
        debugPrint("add item success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future deleteItemAction(String itemcode) async {
    String _tag = "deleteUserAction";

    try {
      var results = await InventoryAPI().deleteItemApi(itemcode);
      if (results['message'] == 'success') {
        debugPrint("delete success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getBestSellAction() async {
    String _tag = "getBestSellAction";

    try {
      var results = await InventoryAPI().getBestSellApi();
      if (results['message'] == 'success') {
        _bestSell = List<Map<String, dynamic>>.from(results['data']);
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future removeBestSellAction(String bestsellno) async {
    String _tag = "removeBestSellAction";

    try {
      var results = await InventoryAPI().removeBestSellNoApi(bestsellno);
      if (results['message'] == 'success') {
        debugPrint("remove best sell success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future addBestSellAction(String code) async {
    String _tag = "addBestSellAction";

    try {
      var results = await InventoryAPI().addBesstSellApi(code);
      if (results['message'] == 'success') {
        debugPrint("add best sell success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getSellRecordAction() async {
    String _tag = "getSellRecordAction";

    try {
      var results = await InventoryAPI().getOrderLogApi();
      if (results['message'] == 'success') {
        _sellRecord = List<Map<String, dynamic>>.from(results['data']);
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getItemFaqAction() async {
    String _tag = "getItemFaqAction";

    try {
      var results = await InventoryAPI().getFaqApi();
      if (results['message'] == 'success') {
        _itemFaq = results['data'];
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future addQuestionAction(Map<String, dynamic> data) async {
    String _tag = "addQuestionAction";

    try {
      var results = await InventoryAPI().addQuestionApi(data);
      if (results['message'] == 'success') {
        debugPrint("add question success");
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getLandingBestSellAction() async {
    String _tag = "getLandingBestSellApi";

    try {
      var results = await InventoryAPI().getLandingBestSellApi();
      if (results['message'] == 'success') {
        _landingBestSell = List<Map<String, dynamic>>.from(results['data']);
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future getLandingItemAction() async {
    String _tag = "getLandingItemAction";

    try {
      var results = await InventoryAPI().getLandingItemApi();
      if (results['message'] == 'success') {
        _landingItem = List<Map<String, dynamic>>.from(results['data']);
      }
    } catch (e) {
      debugPrint("$_tag: $e");
    }
  }

  Future makeOrderAction(Map<String, dynamic> data) async {
    String _tag = "makeOrderAction";

    try {
      var results = await InventoryAPI().makeOrderApi(data);
      if (results['message'] == 'success') {
        _landingItem = List<Map<String, dynamic>>.from(results['data']);
        return results['message'];
      }
    } catch (e) {
      debugPrint("$_tag: $e");
      return 'error';
    }
  }

  //====================================================================================

  Future<void> loadStoreValue() async {
    final prefs = await SharedPreferences.getInstance();
    debugPrint('load data');
    username = prefs.getString('username') ?? "";
    permission = prefs.getString('permission') ?? "";
    debugPrint('username: ${username}');
    debugPrint('permission: ${permission}');
  }

  Future<void> storeData(String username, String permission) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('permission', permission);
    await loadStoreValue();
  }

  Future<void> clearStoreData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
