class Country{
  String name;
  String capital;
  String flag;

  Country({
    this.name,
    this.capital,
    this.flag,
 });

  Country.fromJson(Map<String, dynamic> json){
    name = json['name'];
    capital = json['capital'];
    flag = json['flag'];
  }

}


class CountyResponse{
  List<Country> countries;
  CountyResponse({this.countries});
  CountyResponse.fromJson(dynamic json){
    countries = new List<Country>();
    json.forEach((v) {
      countries.add(new Country.fromJson(v));
    });
  }
}