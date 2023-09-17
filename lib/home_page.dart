import 'package:flutter/material.dart';
import 'package:weather/design.dart';
import 'package:weather/loading_screen.dart';
import 'package:weather/search_city.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.weather, required this.cityWeather});

  var weather;
  var cityWeather;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String temperature = "";
  // String? ubication;
  String locationCity = "";
  String cityWe = "";
  String cityName = "";


  void Ejemplo(){

    temperature = widget.weather["main"]["temp"].toString();
    locationCity = widget.weather["name"].toString();
    cityWe = widget.cityWeather['main']['temp'].toString();
    cityName = widget.cityWeather['name'].toString();
  }
  @override
  void initState() {
    // TODO: implement initState
    Ejemplo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/location_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton( onPressed: (){}, child: Icon(Icons.near_me, size: 45.0)),

                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SearchCity();
                        }
                    ));
                  }, child: Icon(Icons.location_city, size: 45.0)),
                ],
              ),
            ),
            Text(cityWe,
              style: kTempTextFile,
            )
          ],
        ),
      ),
    );
  }
}
