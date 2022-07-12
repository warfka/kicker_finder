import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:kicker_finder/pages/homePage.dart';

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
              style: TextStyle(fontSize: 25, color: Colors.red, fontFamily: 'BalsamiqSans'),
            ),
            const Text(
              'Описание будущего функционала: \n 1) профиль игрока (аватар, никнейм, подробности о игроке) и его статистика (побед/поражений) \n 2) быстрая игра (1 на 1, 2 на 2) \n '
              '3) генерация турнирной сетки и запуск турнира в зависимости от количества игроков',
              style: TextStyle(fontSize: 15, color: Colors.black, fontFamily: 'BalsamiqSans'),
            ),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://github.com/warfka/kicker_finder');
                if (!await launchUrl(url)) throw 'Could not launch $url';
              },
              child: const Text(
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage(title: 'Home Page')));
              },
              fillColor: Colors.red[400],
              child: const Text('Нажмите чтобы начать'),
            ),
          ],
        ),
      ),
    );
  }
}
