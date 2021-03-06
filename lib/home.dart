import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'image_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? lastURL;

  Future<void> _saveLastURL(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastURL', url);
  }

  Future<void> _getLastSavedURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lastURL = prefs.getString('lastURL') ?? getRandomPic();
      _saveLastURL(lastURL!);
    });
  }

  @override
  void initState() {
    _getLastSavedURL();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lorem Picsum'),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: lastURL != null
                ? CachedNetworkImage(
                    imageUrl: lastURL!,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Text(
                      'Error Retreiving Image',
                      style: TextStyle(fontSize: 25),
                    ),
                    fit: BoxFit.contain,
                  )
                : CircularProgressIndicator(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lastURL = getRandomPic();
            _saveLastURL(lastURL!);
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
