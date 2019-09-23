import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/src/models/country_response.dart';
import 'package:http/http.dart' show Client;

class CountryApiProvider{
  Client client = Client();

  Future<CountyResponse> fetchCountryList() async{
    final response = await client.get("http://restcountries.eu/rest/v2/all");
    if(response.statusCode == 200){
      return CountyResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }
}