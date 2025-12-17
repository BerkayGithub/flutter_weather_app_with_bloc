import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_bloc/models/my_theme.dart';
import 'package:flutter_weather_app_with_bloc/models/weather.dart';

class MyThemeViewModel with ChangeNotifier{

  late MyTheme _myTheme;

  MyThemeViewModel(){
    _myTheme = MyTheme(ThemeData.light(), Colors.purple);
  }

  set myTheme(MyTheme yeniTema){
    _myTheme = yeniTema;
    notifyListeners();
  }

  MyTheme get myTheme => _myTheme;

  void temaDegistir(Weather weather){
    switch (weather.current!.condition!.text!.toLowerCase()) {
      case "partly cloudy":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.orangeAccent),
          Colors.yellow,
        );
        break;
      case "sunny":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.orangeAccent),
          Colors.yellow,
        );
        break;
      case "clear":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.orangeAccent),
          Colors.yellow,
        );
        break;
      case "light snow":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.blueGrey),
          Colors.grey,
        );
        break;
      case "overcast":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.blueGrey),
          Colors.grey,
        );
        break;
      case "cloudy":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.indigoAccent),
          Colors.indigo,
        );
        break;
      case "fog":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.indigoAccent),
          Colors.indigo,
        );
        break;
      case "light freezing rain":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.indigoAccent),
          Colors.indigo,
        );
        break;
      case "patchy rain nearby":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.indigoAccent),
          Colors.indigo,
        );
        break;
      case "light rain":
        _myTheme = MyTheme(
          ThemeData(primaryColor: Colors.indigoAccent),
          Colors.indigo,
        );
        break;
    }
    notifyListeners();
  }
}