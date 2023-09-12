import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

void main() {
  runApp(MaterialApp(
    home: scr2(),
  ));
}

class scr2 extends StatefulWidget {
  const scr2({Key? key}) : super(key: key);

  @override
  State<scr2> createState() => _scr2State();
}

class _scr2State extends State<scr2> {
  Weather? weather;

  final openweather = WeatherFactory('e1fb3339e61dfd29eb55d4b8bf77b046');
  String cityName = '';

  getweather() async {
    try {
      weather = await openweather.currentWeatherByCityName(cityName);
      setState(() {});
    } catch (e) {
      print('the error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search City Name'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  cityName = value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                      onPressed: () {
                        getweather();
                      },
                      icon: Icon(Icons.search))),
            ),
          ),
          Expanded(
            child: weather != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weather!.temperature!.celsius!.round()} °C',
                        style: TextStyle(fontSize: 34),
                      ),
                      Text(
                        '${weather!.weatherDescription!}',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
