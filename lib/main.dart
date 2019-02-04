import "package:flutter/material.dart";

void main() {
  runApp(new MaterialApp(
    title: 'Screens',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Firs Page'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(
                labelText: 'Enter text:'
              ),
            )
          ),
          new ListTile(
            title: new RaisedButton(
                child: new Text('Send to next screen'),
                onPressed: () {
                  var router = new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new SecondScreen();
                      });
                  Navigator.of(context).push(router);
                }),
          )
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Second screen'),
      ),
    );
  }
}
