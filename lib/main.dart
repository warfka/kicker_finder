import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const StartPage(title: 'Start Page'),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<StartPage> createState() => _StartPageState();
}
//---------------------
class HomePage extends StatefulWidget{
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class BattlePage extends StatefulWidget{
  const BattlePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class TournamentPage extends StatefulWidget{
  const TournamentPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class KickerMapPage extends StatefulWidget{
  const KickerMapPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<KickerMapPage> createState() => _KickerMapPageState();
}

class PlayerProfilePage extends StatefulWidget{
  const PlayerProfilePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Kicker finder',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontFamily: 'BalsamiqSans'
              ),
            ),
            const Text(
              'Описание будущего функционала: \n 1) профиль игрока (аватар, никнейм, подробности о игроке) и его статистика (побед/поражений) \n 2) быстрая игра (1 на 1, 2 на 2) \n '
                  '3) генерация турнирной сетки и запуск турнира в зависимости от количества игроков' ,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'BalsamiqSans'
              ),
            ),
            TextButton(
                onPressed: () async{
                  final Uri url = Uri.parse('https://github.com/warfka/kicker_finder');
                  if (!await launchUrl(url)) throw 'Could not launch $url';
                },
              child: Text(
                'https://github.com/warfka/kicker_finder',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            RawMaterialButton(
                onPressed: () {
                  //final String title;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: 'Home Page')));
                },
              fillColor: Colors.red[400],
              child: Text('Нажмите чтобы начать'),
            ),
          ],
        ),
      ),
    );
  }
}



class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BattlePage(title: 'Batle Page')));
                },
                child: Text('1x1'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TournamentPage(title: 'Tournament Page')));
              },
              child: Text('Турнир'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => KickerMapPage(title: 'Kicker Map Page')));
              },
              child: Text('Карта площадок'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerProfilePage(title: 'Player Profile Page')));
              },
              child: Text('Профиль'),
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Setings',
        child: const Icon(Icons.adb),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _BattlePageState extends State<BattlePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}

class _TournamentPageState extends State<TournamentPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}

class _KickerMapPageState extends State<KickerMapPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}

class _PlayerProfilePageState extends State<PlayerProfilePage>{

  List<String> _arrayPlayerProfiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
                "https://www.images.lesyadraw.ru/2014/07/kak_narisovat_aang_avatar0.jpg"
            ),
            Text(
              'Любитель Кикера' ,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontFamily: 'BalsamiqSans'
              ),
            ),
            new ListView.builder( //ToDo Best players list
              itemBuilder: (context, index) {
                return new Text('Player $index');
              },
            ),
          ],
        ),
      ),
    );
  }
}