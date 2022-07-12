import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kicker_finder/futureBuilderForPlayerProfile.dart';
import 'dart:convert';
import 'package:kicker_finder/user.dart';

import 'package:kicker_finder/data.dart';
import 'package:kicker_finder/dioClient.dart';

class PlayerProfilePage extends StatefulWidget {
  const PlayerProfilePage({Key? key, required this.title})
      : super(key: key);
  final String title;
  //final List<TopPlayer> topPlayers;  , required this.topPlayers

  @override
  State<PlayerProfilePage> createState() => _PlayerProfilePageState();
}

class TopPlayer {
  late String playerNickname;
  late String playerSlogan;

  TopPlayer(this.playerNickname, this.playerSlogan);
}

/*List<PlayerProfile> parsePlayerProfile(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<PlayerProfile> playerProfiles = list.map((model) => PlayerProfile.fromJson(model)).toList();
  return playerProfiles;
}*/


class _PlayerProfilePageState extends State<PlayerProfilePage> {

  final DioClient _client = DioClient();

  /*Future<PlayerProfile> fetchPlayerProfile() async{
    final dio = Dio();
    var response =
    await dio.get('https://jsonplaceholder.typicode.com/posts/1');
    return PlayerProfile.fromJson(response.data);
  }*/

  //late Future<PlayerProfile> loadPlayerProfile;

  /*@override
  void initState() {
    loadPlayerProfile = fetchPlayerProfile();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
                color: Colors.white,
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('img/firstPlayer.jpg'),
                    radius: 60,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'не работает'//FirebaseAuth.instance.currentUser!.displayName!,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Text('Процент побед: 50 \n Количество игр: 10 \n Количество кубков: 0'),
                ),
              ),
            ),
            Text('Лучшие игроки'),
            /*Expanded(
              flex: 3,
              child: FutureBuilder<User?>(
                future: _client.getUser(id: '2'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    User? userInfo = snapshot.data;

                    if (userInfo != null) {
                      Data userData = userInfo.data;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(userData.avatar),
                          SizedBox(height: 8.0),
                          Text(
                            '${userInfo.data.firstName} ${userInfo.data.lastName}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            userData.email,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      );
                    }
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
