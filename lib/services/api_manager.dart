import 'dart:async';
import 'dart:convert';

import 'package:application1/models/shoesinfo.dart';
import 'package:http/http.dart' as http;

class API_MANAGER {
  Future<List<Shoes>> getShoes() async {
    var client = http.Client();
    List<Shoes> shoesModel = [];

    try {
      var response = await client.get(Uri.parse(
          'https://6221a189afd560ea69b55d23.mockapi.io/shoes/api/products'));

      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        shoesModel = List<Shoes>.from(
            json.decode(response.body).map((data) => Shoes.fromJson(data)));
      }
    } catch (e, s) {
      print(e);
      print(s);

      return shoesModel;
    }
    return shoesModel;
  }
}
