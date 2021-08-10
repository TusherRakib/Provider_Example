import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:testing_testing/age.dart';
import 'package:flutter_otp/flutter_otp.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterUpdateModel(),
      child: CounterUpdate(),
    ),
  );
}

class CounterUpdate extends StatefulWidget {
  @override
  _CounterUpdateState createState() => _CounterUpdateState();
}

class _CounterUpdateState extends StateMVC<CounterUpdate> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter update'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Consumer<CounterUpdateModel>(
            builder: (context, counter, child) {
              return Container(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(counter.count.toString()),
                    ),
                    Container(
                      child: TextFormField(
                        controller: _textEditingController,
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        counter.counterUpdate(_textEditingController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenPage()),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        child: Center(
                          child: Container(
                            height: 40,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                'Counter update', style: TextStyle(
                                  color: Colors.white
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CounterUpdateModel extends ChangeNotifier {
  var count = 0;
  String name = "";

  void counterUpdate(String _name) {
    this.name = _name;
    count++;
    notifyListeners();
  }
}