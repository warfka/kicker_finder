import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:kicker_finder/pages/homePage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
