import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:testing_testing/main.dart';
class ScreenPage extends StatefulWidget {

  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Consumer<CounterUpdateModel>(
              builder: (context, counter, child) {
                return Column(
                  children: [
                    Text(counter.name.toUpperCase()),
                    Text(counter.count.toString()),
                  ],
                );
              })
        ),
      ),
    );
  }
}
