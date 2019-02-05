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

  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
          builder: (BuildContext context) {
            return new SecondScreen(name: _nameFieldController.text);
          }
      )
    );
    if(results != null && results.containsKey('info')) {
      _nameFieldController.text = results['info'];
    } else {
      print('nothing');
    }
  }
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
                  onPressed: () {_goToNextScreen(context);}
                ),
          ),
          new ListTile(
            title: new Text('test')
          )
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final String name;
  SecondScreen({Key key, this.name}) : super (key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  var _backTextFieldcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text('Second screen'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('${widget.name}'),
            ),
            new ListTile(
              title: new TextField(
                controller: _backTextFieldcontroller,
                decoration: new InputDecoration(
                    labelText: 'Say hello to first screen'
                ),
              )
            ),
            new ListTile(
              title: new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'info': _backTextFieldcontroller.text
                    });
                  },
                  child: new Text('Send data back')
              )
            )
          ],
        ),
      )
    );
  }
}
