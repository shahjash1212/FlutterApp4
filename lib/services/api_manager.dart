import 'dart:async';
import 'dart:convert';

import 'package:application1/models/shoesinfo.dart';
import 'package:http/http.dart' as http;

class API_MANAGER {
  Future<List<Shoes>> getShoes() async {
    var client = http.Client();
    var shoesModel;

    try {
      var response = await client.get(Uri.parse(
          'https://6221a189afd560ea69b55d23.mockapi.io/shoes/api/products'));

      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        // var jsonMap = jsonDecode(jsonString);
        var jsonresponse = json.decode(response.body);

        shoesModel = Shoes.fromJson(jsonresponse[0]);
        // shoesModel = Shoes.fromJson();
      }
    } catch (e, s) {
      print(e);
      print(s);
      return shoesModel;
    }
    return shoesModel;
  }
}
