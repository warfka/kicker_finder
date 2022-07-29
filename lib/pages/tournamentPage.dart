import 'package:flutter/material.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {


/*
  final Future<String> getFutureTournaments = Future<String>.delayed(
    const Duration(seconds: 3),
    () => 'Летний турнир, Экстра турнир',
  );*/
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: getFutureTournaments,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Турниры: ${snapshot.data}'),
                  );
          },
        ),
      ),
    );
  }*/

/*Column(
                        children: List.generate(
                            4,//snapshot.data.length,
                              (index) => Text(
                                snapshot.data,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                          ),
                      ),

   */

  Future<List<String>> getFutureTournaments() async{
    await Future.delayed(
      Duration(seconds: 3),
    );
    return ["Летний турнир","Зимний турнир","Межсезонье", "Экстра турнир"];
  }

  final Future<String> getFutureTournamentsTEST = Future<String>.delayed(
    const Duration(seconds: 2),
        () => 'Data Loaded',
  );

  final Future<List<String>> getFutureTournamentsTEST2 = Future<List<String>>.delayed(
    const Duration(seconds: 2),
        () => ['Летний турнир','Зимний турнир','Межсезонье', 'Экстра турнир'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: getFutureTournamentsTEST, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                const Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      ListView.builder(
                        //itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            //title: Text(snapshot.data[index].),
                          );
                          }
                      ),
                    ],
                  ),
                )
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                )
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Поиск турниров...'),
                )
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),

    );
  }
}
