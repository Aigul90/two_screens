import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  final String? replace;

  Home({Key? key, this.replace}) :super (key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Set <String> names = {};
  String textIdea = " ";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 239, 221, 246),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            title: Text("Список участников"),
            centerTitle: true,
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
                          labelText: 'Ваше имя',
                        ),
                        onChanged: (String str) {
                          setState(() {
                            textIdea = str;
                          });
                        },
                      ),
                      Text(
                        '''Здравствуйте, $textIdea!
                   ''',
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(10.0),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                          minimumSize: MaterialStateProperty.all(Size(100, 50)),
                        ),
                        child: Text("Добро пожаловать!"),
                        onPressed: () {
                          setState(
                                () {
                              names.add('$textIdea');
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(1),
                  itemCount: names.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: ListTile(
                        title: Text(
                          widget.replace != null ? widget.replace! : names
                              .elementAt(index),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            iconSize: 24.0,
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                names.remove(names.elementAt(index));
                              });
                            }

                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SecondScreen(screenTitle: names.elementAt(index),),),);
                      },
                    );
                  },),),
            ],)

      ),);
  }

}

