import 'package:flutter/material.dart';

class KickerMapPage extends StatefulWidget {
  const KickerMapPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<KickerMapPage> createState() => _KickerMapPageState();
}

class _KickerMapPageState extends State<KickerMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }
}
