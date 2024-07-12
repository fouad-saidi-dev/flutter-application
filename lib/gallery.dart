import 'package:flutter/material.dart';
import 'package:my_app_flutter/gallery_data.dart';

/*
class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery'),backgroundColor: Colors.orange,),
      body: Center(child: Text('Gallery',style: TextStyle(fontSize: 22),),
      ),
    );
  }

}*/

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(keyword),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter key word',
              ),
              onChanged: (value) {
                setState(() {
                  keyword = value;
                });
              },
              onSubmitted: (value) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GalleryData(keyword),
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  child: Text('Get Image'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GalleryData(keyword)));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrangeAccent, // Text color
                    elevation: 5, // Elevation
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
