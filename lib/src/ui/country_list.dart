import 'package:flutter/material.dart';
import 'package:flutter_app/src/bloc/country_bloc.dart';
import 'package:flutter_app/src/models/country_response.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CountryList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CountyListState();
  }
}


class CountyListState extends State<CountryList>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchCountries();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC Architechture',style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
        stream: bloc.allCountries,
        builder: (context, AsyncSnapshot<CountyResponse> snapshot){
          if(snapshot.hasData){
            return buildList(snapshot);
          }else{
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        }
      ),
    );
  }

  Widget buildList(AsyncSnapshot<CountyResponse> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.countries.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return getStructuredGridCell(snapshot.data.countries[index]);
        });
  }

  Card getStructuredGridCell(Country country) {
    return Card(
        elevation: 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SvgPicture.network(
              country.flag.replaceAll('https', 'http'),
              height: 130.0,
              width: 100.0,
              placeholderBuilder: (BuildContext context) => Container(
                child: CircularProgressIndicator(),
                padding: EdgeInsets.all(70),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(country.capital),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(country.name),
            )
          ],
        ));
  }


}