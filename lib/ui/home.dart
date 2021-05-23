import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:picsum/helpers/image_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lorem Picsum'),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: CachedNetworkImage(
              imageUrl: getRandomPic(),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Text(
                'Error Retreiving Image',
                style: TextStyle(fontSize: 25),
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getRandomPic();
          });
        },
        child: Icon(
          Icons.refresh,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
