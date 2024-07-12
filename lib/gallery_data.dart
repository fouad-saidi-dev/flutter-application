import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryData extends StatefulWidget {
  String keyword='';
  GalleryData(this.keyword);
  @override
  _GalleryDataState createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  List<dynamic> data=[];
  int currentPage=1;
  int pageSize=10;
  int totalPages=0;
  ScrollController scrollController=ScrollController();
  dynamic dataGallery;
  List<dynamic> hist = [];

  @override
  void initState() {
    super.initState();
    loadData();
    this.scrollController.addListener((){
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        if(currentPage<totalPages){
          ++currentPage;
          this.loadData();
        }
      }
    });
  }

  void getGalleryData(String url) {
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        dataGallery = json.decode(resp.body);
        if (dataGallery != null) {
          hist.addAll(dataGallery['hits']);
          int totalHits = dataGallery['totalHits'];
          totalPages = (totalHits / pageSize).ceil();
        }
      });
    }).catchError((err) {
      print(err);
    });
  }


  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void loadData(){
    String url="https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyword}&page=$currentPage&per_page=$pageSize";
    if (kDebugMode) {
      print(url);
    }
    getGalleryData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.keyword} : ${currentPage} / ${totalPages}') ,backgroundColor:
      Colors.deepOrange,),
      body: (dataGallery==null)? Center(child: CircularProgressIndicator()):
      ListView.builder(
          controller:scrollController ,
          itemCount: dataGallery==null?0:hist.length,
          itemBuilder: (context,index){
            return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
                    child: Card(
                        color: Colors.deepOrange,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(hist[index]['tags'],style: TextStyle(fontSize: 20,color:
                          Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 5,left: 5,top: 0,bottom: 0),
                    child: Card(
                        child: Image.network(hist[index]['previewURL'],fit: BoxFit.fitWidth,)),
                  ),
                  Divider(color: Colors.grey,thickness: 2,),
                ]
            );
          })
      ,
    );
  }
}