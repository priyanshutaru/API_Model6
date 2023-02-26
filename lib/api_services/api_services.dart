import 'dart:convert';

import 'package:api14/model/apimodel.dart';
import 'package:http/http.dart' as http;

var base = "https://dummyjson.com";

getCard() async {
  var res = await http.get(Uri.parse("$base/carts"));

  try {
    if (res.statusCode == 200) {
      var data = myProductFromJson(res.body);
      return data.carts;
    } else {
      return ("data is loading");
    }
  } catch (e) {
    print(e.toString());
  }
}
