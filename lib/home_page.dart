import 'package:flutter/material.dart';

import 'other_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainUser =
      "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2097124721,3074829049&fm=26&gp=0.jpg";
  String otherUser =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551074077014&di=4f29c59729752ed9cf4467797624442c&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201709%2F21%2Fa05161a4469dc5ef8be88ee217d53d92.jpg";

  void switchUser() {
    String backupstring = mainUser;
    this.setState(() {
      mainUser = otherUser;
      otherUser = backupstring;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("jjsmd"),
              accountEmail: new Text("jjsmd@123456.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => switchUser(),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(mainUser),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => print("This is the other user"),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(otherUser),
                  ),
                )
              ],
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "https://img3.mukewang.com/szimg/5c3c7c2208b5d44806000338.jpg"))),
            ),
            new ListTile(
              title: new Text("first page"),
              trailing: new Icon(Icons.accessibility),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("first page")));}
            ),
            new ListTile(
              title: new Text("second page"),
              trailing: new Icon(Icons.accessible),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("second page")));}
            ),
            new Divider(),
            new ListTile(
              title: new Text("close"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text("My Drawer App "),
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new Text(
          "HomePage",
          style: new TextStyle(fontSize: 26.0),
        ),
      ),
    );
  }
}
