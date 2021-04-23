import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/src/widgets/image_list.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import './models/image_model.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage() async {
    counter++;
    final url =
        Uri.parse('https://api.unsplash.com/photos/random?client_id=n5WapLuF01FXNokFKIlYlEOEZN_5XL-CjhWnGlKUk8Y');
    var response = await get(url);
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text('Lets see some images!'),
        ),
      ),
    );
  }
}