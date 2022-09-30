import 'package:flutter/material.dart';
import 'package:task/utilities/database_helper.dart';
import 'package:task/modules/home_screen.dart';

class Options extends StatefulWidget {
  _Options createState() => _Options();
}

class _Options extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Options',
        ),
      ),
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Use Local Database',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Switch(
                  value: helper.isSwitched,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    print("VALUE : $value");
                    setState(() {
                      helper.isSwitched = value;
                    });
                  },
                ),
              ]),
          Divider(),
        ],
      ),
    );
  }
}
