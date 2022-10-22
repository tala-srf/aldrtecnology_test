import 'dart:convert';

import 'package:flutter_application_1/model/condition_model.dart';


import 'package:http/http.dart' as http;

class Data {
  final autour1 =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=868ebb9be4d34eb2b10df892c7be5b5b';
  Future<ConditionModel> fetchData() async {
    http.Response response = await http.get(Uri.parse(autour1));
     Map<String, dynamic>?  mediate = jsonDecode(response.body);
    return ConditionModel.fromJson(mediate!);
  }
}