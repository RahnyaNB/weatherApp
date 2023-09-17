import 'package:flutter/material.dart';
import 'package:weather/design.dart';
import 'package:weather/weather.dart';

import 'home_page.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}


class _SearchCityState extends State<SearchCity> {

  void getData () async {

    var city_name = "Santiago";
    final urlCity = 'https://api.openweathermap.org/data/2.5/weather?q=${city_name}&appid=44c764c46837f9658c3230fdbf748507';

    Weather CityWeather = Weather(urlCity);
    var CityData = await CityWeather.getWeather();


  }
  final myController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Center(
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
          ),
          TextButton(onPressed: (){},
              child: Text('Get Weather')
          )
        ],
      ),
    );
  }
}
