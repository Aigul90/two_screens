import 'package:two_displays/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class SecondScreen extends StatefulWidget {
  final screenTitle;

  SecondScreen({Key? key, required this.screenTitle}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String itogIdea = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.screenTitle,
        ),

        //
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Заменить участника',
                    ),
                    onChanged: (String str) {
                      setState(() {
                        itogIdea = str;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(10.0),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                      minimumSize: MaterialStateProperty.all(Size(100, 50)),
                    ),
                    child: Text("$itogIdea \nВы внесены в список! \n"),
                    onPressed: () {
                      setState(
                            () {
                          Navigator.of(context).pop(
                            MaterialPageRoute(
                              builder: (context) => Home(replace: "$itogIdea"),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
