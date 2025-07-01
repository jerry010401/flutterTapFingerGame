import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    height: 150,
                    minWidth: 150,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(),
                          ));
                    },
                    child: Text("START"),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            color: Colors.red,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.white,
                    shape: CircleBorder(),
                    height: 150,
                    minWidth: 150,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(),
                          ));
                    },
                    child: Text("START"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double BlueHightCard = 0;
  double RedHightCard = 0;
  bool initialized = false;
  int PlayerAScore = 0;
  int PlayerBScore = 0;
  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      BlueHightCard = MediaQuery.of(context).size.height / 2;
      RedHightCard = MediaQuery.of(context).size.height / 2;
      initialized = true;
    }
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(BlueHightCard);
              setState(() {
                BlueHightCard = BlueHightCard + 30;
                RedHightCard = RedHightCard - 30;
                PlayerBScore = PlayerBScore + 5;
              });
              double WinningHeight = MediaQuery.of(context).size.height - 60;

              print(BlueHightCard);
              print(WinningHeight);

              if (BlueHightCard > WinningHeight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(PlayerBScore, "B"),
                    ));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: BlueHightCard,
              width: double.infinity,
              color: Colors.blueAccent,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "PLAYER B",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                  Text(
                    PlayerBScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                BlueHightCard = BlueHightCard - 30;
                RedHightCard = RedHightCard + 30;
                PlayerAScore = PlayerAScore + 5;
              });

              double WinningHight = MediaQuery.of(context).size.height - 60;
              print(RedHightCard);
              print(WinningHight);

              if (RedHightCard > WinningHight) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(PlayerAScore, "A"),
                    ));
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: RedHightCard,
              width: double.infinity,
              color: Colors.red,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "PLAYER A",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                  Text(
                    PlayerAScore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  int score = 0;
  String Player = "";

  ResultPage(this.score, this.Player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Player == "A" ? Colors.red : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              Player == "A" ? "PLAYER A WON" : "PLAYER B WON",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text(
                "RESTART GAME",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
