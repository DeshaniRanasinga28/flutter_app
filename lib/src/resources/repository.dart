import 'dart:async';
import 'package:flutter_app/src/models/country_response.dart';
import 'country_api_provider.dart';

class Repository{
  final moviesApiProvider = CountryApiProvider();

  Future<CountyResponse> fetchCountries() => moviesApiProvider.fetchCountryList();
}