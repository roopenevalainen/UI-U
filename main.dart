import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Program initiates at main and executes the app
void main() => runApp(MyCalculator());

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tattoos = [
    'Tattoo picture #1',
    'Tattoo picture #2',
    'Tattoo picture #3',
    'Tattoo picture #4',
    'Tattoo picture #5',
    'Tattoo picture #6',
    'Tattoo picture #7',
    'Tattoo picture #8',
    'Tattoo picture #9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Tattoo master'),
      backgroundColor: Colors.redAccent.withOpacity(0.6),),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent.withOpacity(0.6),
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "My tattoos",
          backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
              label: "Search tattoos",
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(icon: Icon(Icons.save),
              label: "Saved tattoos",
              backgroundColor: Colors.black
          ),
        ],
      ) ,
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(32)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Find the best tattoo for you',
                      suffixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
              )),
          Expanded(
              child: Container(
                  child: GridView.builder(
                      itemCount: tattoos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return Button(
                            btnTxt: tattoos[index],
                            color: Colors.grey,
                            txtColor: Colors.white);
                      }))),

        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  final color;
  final txtColor;
  final String btnTxt;

  Button({this.color, this.txtColor, this.btnTxt});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                btnTxt,
                style: TextStyle(color: txtColor),
              ),
            ),
          ),
        ));
  }
}
