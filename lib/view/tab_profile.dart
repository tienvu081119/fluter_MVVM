import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabProfile extends StatelessWidget{
  String text; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: MultiProvider(
          providers: [
           ChangeNotifierProvider<SimpleStringData>(
              create: (_) => SimpleStringData(),
            ),
            Provider(
              create: (_) => SecondStringData(text: "Second provider text"),
            ),
          ],
           child: Widget_1(),
        ),
      ),
    );
  }
}

class SimpleStringData with ChangeNotifier {
  String _text = '';

  String get text => _text;

  void changeText(String text) {
    this._text = text;
    notifyListeners();
  }
}
class SecondStringData {
  String text;

  SecondStringData({this.text});
}

class Widget_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widget_2();
  }
}

class Widget_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widget_3();
  }
}

class Widget_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widget_4();
  }
}

class Widget_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widget_5();
  }
}

class Widget_5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widget_6();
  }
}


class Widget_6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextWidget(),
            InputWidget(),
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleStringData>(builder: (
      context,
      data,
      __,
    ) {
      return Text(
        '${data.text}',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 35,
        ),
      );
    });
  }
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleStringData>(builder: (
      context,
      data,
      __,
    ) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: TextField(
          onChanged: (String e) {
            data.changeText(e);
          },
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Change me',
          ),
        ),
      );
    });
  }
}