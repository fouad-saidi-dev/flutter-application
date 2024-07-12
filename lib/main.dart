import 'package:flutter/material.dart';
import 'package:my_app_flutter/camera_page.dart';
import 'package:my_app_flutter/quiz.dart';
import 'package:my_app_flutter/weather_form.dart';
import 'package:my_app_flutter/gallery.dart';
import 'package:my_app_flutter/weather.dart';
import 'package:my_app_flutter/weather_form.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyScreen(),
    );
  }

}

class MyScreen extends StatelessWidget{
  const MyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            children: <Widget> [
              DrawerHeader(
                child:Center(
                  child:CircleAvatar(
                      backgroundImage: AssetImage('images/avatar.png'),
                      radius: 50.0
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.white,
                      ],
                    )
                ),
              ),
              ListTile(
                title: Text(
                  'Quiz',style: TextStyle(fontSize: 20),
                ),
                trailing:  Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),
                  );
                },
              ),
              Divider(color: Colors.amberAccent,),
              ListTile(
                title: Text(
                  'Weither',style: TextStyle(fontSize: 20),
                ),
                trailing:  Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherForm()),
                  );
                },
              ),
              Divider(color: Colors.amberAccent,),
              ListTile(
                title: Text(
                  'Gallery',style: TextStyle(fontSize: 20),
                ),
                trailing:  Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Gallery()),
                  );
                },
              ),
              Divider(color: Colors.amberAccent,),
              ListTile(
                title: Text(
                  'Camera',style: TextStyle(fontSize: 20),
                ),
                trailing:  Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraPage()),
                  );
                },
              ),
            ]
        ),
      ),
      appBar: AppBar(title: const Text('My First App'),backgroundColor: Colors.orange,),
      body: const Center(child: Text('Hello World',style: TextStyle(fontSize: 30),),),
    );
  }
}
