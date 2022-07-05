import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ropstam_task/models/ListModel.dart';
import 'package:ropstam_task/utils/api_end_points.dart';

class ApiClient {
  Future<List<ListModel>?> getList() async {
    var response = await http.get(
      Uri.parse(APIEndPoints.LIST_API),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      var decoder = jsonDecode(response.body);
      List<ListModel> mList = [];
      for (var e in decoder) {
        mList.add(
            ListModel(id: e['id'], body: e['body'], title: e['title'],userId: e['userId']));
      }
      return mList;
    } else {
      return null;
    }
  }
}
