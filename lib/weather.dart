import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

// this code for counter
/*
class Weather extends StatelessWidget {
  int counter;
  Weather(this.counter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather'),backgroundColor: Colors.orange,),
      body: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Counter=$counter',style: TextStyle(fontSize: 22),),
              ElevatedButton(
                child: Text('Add'),
                onPressed: () {
                    ++counter;
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                  elevation: 5, // Elevation
                ),


              )
            ],
          ),
        ),

      ),
    );
  }

}*/

class Weather extends StatefulWidget {
  String city;

  Weather(this.city, {super.key});

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<dynamic> weatherData = [];

  @override
  void initState() {
    super.initState();
    String url =
        'http://api.openweathermap.org/data/2.5/forecast?q=${widget.city}&appid=49c59c16da186fb977d04ec9538ec009';
    print(url);
    this.getData(url);
  }

  getData(url) {
    http.get(Uri.parse(url), headers: {'accept': 'application/json'}).then(
        (resp) {
      setState(() {
        weatherData = json.decode(resp.body)['list'];
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather of ${widget.city}'),
          backgroundColor: Colors.orange,
        ),
        body: (weatherData == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: weatherData == null ? 0 : weatherData.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.deepOrangeAccent,
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'images/${weatherData[index]['weather'][0]['main'].toLowerCase()}.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${new DateFormat('E dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))}',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt'] * 1000000))} | ${weatherData[index]['weather'][0]['main']}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${(weatherData[index]['main']['temp'] - 273.15).round()} °C',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )));
                },
              ));
  }
}
