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
      ),
      body: Center(
        child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: CachedNetworkImage(
                    imageUrl: getRandomPic(
                      MediaQuery.of(context).size.height -
                          AppBar().preferredSize.height,
                      MediaQuery.of(context).size.width,
                    ),
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Text(
                      'Error Retrieving Image',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getRandomPic(
              MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height,
              MediaQuery.of(context).size.width,
            );
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
