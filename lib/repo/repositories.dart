import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mywatchlist/constants/app_constant.dart';
import 'package:mywatchlist/model/header_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListRepository {
  Future<List<WatchListData>> getData() async {
    var response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      final List<WatchListData> result1 =
          result.map((e) => WatchListData.fromJson(e)).toList();
      List<Map<String, dynamic>> serializedList =
          result1.map((obj) => obj.toJson()).toList();
      // final List<String> strResult =
      //     result1.map((e) => (e).toString()).toList();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String serialized = jsonEncode(serializedList);
      await prefs.setString('yourKey', serialized);
      return result.map((e) => WatchListData.fromJson(e)).toList();
    } else {
      debugPrint('inside else');
      debugPrint(response.toString());
      throw Exception(response.reasonPhrase);
    }
  }
}
