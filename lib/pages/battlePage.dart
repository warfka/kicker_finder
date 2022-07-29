import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BattlePage extends StatefulWidget {
  const BattlePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BattlePage> createState() => _BattlePageState();
}

class _BattlePageState extends State<BattlePage> {
  void getHttp() async {
    try {
      var response = await Dio().get('http://www.google.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  getHttp();
                },
                child: const Text('get')),
            Container(
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}