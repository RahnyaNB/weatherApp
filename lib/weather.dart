import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Weather{
  // final url = "https://api.openweathermap.org/data/2.5/weather?lat=37.4220936&lon=-122.083922&appid=44c764c46837f9658c3230fdbf748507";
  final url;

  Weather(this.url);


  Future getWeather() async{
  String key = "428bb7b8fb23ee509527fcbc7724cdf9";
    // https://api.openweathermap.org/data/2.5/weather?lat=37.4220936&lon=-122.083922&appid=44c764c46837f9658c3230fdbf748507
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    }

  }
}