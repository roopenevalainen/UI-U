import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Program initiates at main and executes the app
void main() => runApp(MyTattooApp());

class MyTattooApp extends StatelessWidget {
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
          label: "Home",
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
                        return TattooPic(
                            tattoos[index],
                            "\n\n\n*insert picture here*\n\n",
                            );
                      }))),

        ],
      ),
    );
  }
}

// See https://flutter.dev/docs/development/ui/interactive
class TattooPic extends StatefulWidget {
  TattooPic(this.tattoo, this.tattooPicture);

  final String tattoo;
  final String tattooPicture;

  @override
  _TattooPic createState() =>
      _TattooPic(this.tattoo, this.tattooPicture);
}

class _TattooPic extends State<TattooPic> {
  // Content vars
  String tattoo;
  String tattooPicture;
  bool _isFavorited = false;

  _TattooPic(this.tattoo, this.tattooPicture);

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(0.5),
        child: ListTile(
          leading: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Theme.of(context).accentColor,
            onPressed: _toggleFavorite,
          ),
          title: Text(tattoo),
          subtitle: Text(tattooPicture),
        ));
  }
}
