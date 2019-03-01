import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'video_cell.dart';
import 'home_page.dart';

void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RealWorldState();
  }
}

class RealWorldState extends State<RealWorldApp> {
  var _isreloading = true;

  var videos;

  _fetchdata() async {
    print("Attempting to fetch data from network ");

    final url = "https://api.letsbuildthatapp.com/youtube/home_feed";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body);

      final videoJson = map["videos"];

      setState(() {
        _isreloading = false;
        this.videos = videoJson;
      });

      //print(map["videos"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Real World App Flutter Bar"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {
                  //print("reloading.....");
                  setState(() {
                    _isreloading = true;
                  });
                  _fetchdata();
                })
          ],
        ),
        body: new Center(
          child: _isreloading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: this.videos != null ? this.videos.length : 0,
                  itemBuilder: (context, i) {
                    final video = this.videos[i];
                    return new FlatButton(
                        padding: new EdgeInsets.all(0.0),
                        onPressed: () {
                          print("Video cell click : $i");
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new HomePage()));
                        },
                        child: new VideoCell(video));
                  }),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail Page "),
      ),
      body: new Center(
        child: new Text("detail detail detail"),
      ),
    );
  }
}
