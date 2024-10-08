import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class InventoryAPI {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 600),
    receiveTimeout: const Duration(milliseconds: 600),
    sendTimeout: const Duration(milliseconds: 600),
  ));
  final endPoint = "http://localhost:8080";

  Future postmanTemplate(header) async {
    String _tag = "postmanTemplate";
    try {
      // add header if have any
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = '$header';
            return handler.next(options);
          },
        ),
      );
      // response for get or post
      final res =
          await dio.post('$endPoint/api/test', queryParameters: {'test': 1});
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future loginApi(username, password) async {
    String _tag = "loginApi";
    try {
      Map<String, dynamic> data = {'username': username, 'password': password};
      final res = await dio.post('$endPoint/v1/login/authen', data: data);
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getUserApi() async {
    String _tag = "getUserApi";
    try {
      final res = await dio.get('$endPoint/v1/login/user/getuser');
      return res.data;
    } catch (e) {
      debugPrint('$_tag: $e');
    }
  }

  Future deleteUserApi(id) async {
    String _tag = "deleteUserApi";
    try {
      final res = await dio
          .get('$endPoint/v1/login/user/delete', queryParameters: {'id': id});
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getUserByUsernameApi(username) async {
    String _tag = "getUserByUsernameApi";
    try {
      final res = await dio.get('$endPoint/v1/login/user/getuserbyusername',
          queryParameters: {'username': username});
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future updateUserApi(Map<String, dynamic> data) async {
    String _tag = "updateUserApi";
    try {
      final res = await dio.post('$endPoint/v1/login/user/update', data: data);
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future saveUserApi(Map<String, dynamic> data) async {
    String _tag = "saveUserApi";
    try {
      final res = await dio.post('$endPoint/v1/login/user/save', data: data);
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getItemApi() async {
    String _tag = "getItemApi";
    try {
      final res = await dio.get('$endPoint/v1/item/stock/getitem');
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future addItemApi(Map<String, dynamic> data) async {
    String _tag = "addItemApi";
    try {
      final res = await dio.post('$endPoint/v1/item/stock/additem', data: data);
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getItemByCodeApi(itemcode) async {
    String _tag = "getItemByCodeApi";
    try {
      final res = await dio.get('$endPoint/v1/item/stock/getitembycode',
          queryParameters: {'itemcode': itemcode});
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future updateItemApi(Map<String, dynamic> data) async {
    String _tag = "updateItemApi";
    try {
      final res =
          await dio.post('$endPoint/v1/item/stock/updateitem', data: data);
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future deleteItemApi(itemcode) async {
    String _tag = "deleteItemApi";
    try {
      final res = await dio.get('$endPoint/v1/item/stock/delete',
          queryParameters: {'itemcode': itemcode});
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getBestSellApi() async {
    String _tag = "getBestSellApi";
    try {
      final res = await dio.get('$endPoint/v1/item/stock/getbestsell');
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future addBesstSellApi(code) async {
    String _tag = "addBesstSellApi";
    try {
      final res = await dio.post('$endPoint/v1/item/stock/updateitem',
          queryParameters: {'code': code});
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future removeBestSellNoApi(bestsellno) async {
    String _tag = "getBestSellNoApi";
    try {
      final res = await dio.get('$endPoint/v1/item/stock/bestsellno',
          queryParameters: {'bestsellno': bestsellno});
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getOrderLogApi() async {
    String _tag = "getOrderLogApi";
    try {
      final res = await dio.get('$endPoint/v1/item/stock/getorderlog');
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getFaqApi() async {
    String _tag = "getFaqApi";
    try {
      final res = await dio.get('$endPoint/v1/item/faq/getfaq');
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future addQuestionApi(Map<String, dynamic> data) async {
    String _tag = "getFaqApi";
    try {
      final res =
          await dio.post('$endPoint/v1/item/faq/addquestion', data: data);
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getLandingBestSellApi() async {
    String _tag = "getLandingBestSell";
    try {
      final res = await dio.get('$endPoint/v1/landing/item/getbestsell');
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future getLandingItemApi() async {
    String _tag = "getLandingItem";
    try {
      final res = await dio.get('$endPoint/v1/landing/item/getitem');
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future makeOrderApi(Map<String, dynamic> data) async {
    String _tag = "makeOrderApi";
    try {
      final res =
          await dio.post('$endPoint/v1/item/stock/orderitem', data: data);
      return res.data;
    } catch (e) {
      debugPrint('$e');
    }
  }
}
