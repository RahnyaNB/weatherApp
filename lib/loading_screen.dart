import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/home_page.dart';
import 'package:weather/location.dart';
import 'package:weather/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
  }


  void getData () async
  {

    Location currentPosition = Location();
    await currentPosition.getPosition();

    final url = "https://api.openweathermap.org/data/2.5/weather?lat=${currentPosition.latitud}&lon=${currentPosition.longitud}&appid=44c764c46837f9658c3230fdbf748507&units=metric";
    Weather currentWeather = Weather(url);
    var weatherData = await currentWeather.getWeather();

    var city_name = "Santiago";
    final urlCity = 'https://api.openweathermap.org/data/2.5/weather?q=${city_name}&appid=44c764c46837f9658c3230fdbf748507';

    Weather CityWeather = Weather(urlCity);
    var CityData = await CityWeather.getWeather();

    Navigator.push(context, MaterialPageRoute(
        builder: (context) {
        return HomePage(weather: weatherData, cityWeather: CityData);
        }
      )
    );
    // print(CityData);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
      ),
    );
  }
}
