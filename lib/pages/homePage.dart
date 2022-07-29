import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kicker_finder/pages/playerProfilePage.dart';

import 'package:kicker_finder/pages/battlePage.dart';
import 'package:kicker_finder/pages/settingsPage.dart';
import 'package:kicker_finder/pages/tournamentPage.dart';
import 'package:kicker_finder/pages/kickerMapPage.dart';

import 'package:kicker_finder/auth_service.dart';

import '../UIElements/buttons.dart';

handleAuthState() {
  return StreamBuilder(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasData) {
        return PlayerProfilePage(title: 'Player profile page');
      } else {
        return SettingsPage(title: 'Settings page');
      }
    },
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get page => BattlePage(title: 'Batle Page');
  Router rout = BattlePage(title: 'Batle Page') as Router;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  squareButton(toPage: BattlePage(title: 'Batle Page'),
                      //onPressed: page,
                      size: 150,
                      buttonText: '1x1',
                      //toPageTest2: page,
                      context: context),

                  squareButton(toPage: TournamentPage(title: 'Tournament Page'),
                      size: 150,
                      buttonText: 'Турнир',
                      context: context),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  squareButton(toPage: KickerMapPage(title: 'Kicker Map Page'),
                      size: 150,
                      buttonText: 'Карта площадок',
                      context: context),

                  squareButton(toPage: PlayerProfilePage(
                    title: 'Player Profile Page',
                    /*topPlayers: List.generate( это нужно для будующего функционала
                                          50,
                                              (index) =>
                                              TopPlayer('Player $index', 'I am number $index goodbye')),*/
                  ),
                      size: 150,
                      buttonText: 'Профиль',
                      context: context),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsPage(title: 'Settings Page')));

        },
        tooltip: 'Setings',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
