import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TikTacToeGame extends StatefulWidget {
  TikTacToeGame({int Type}) {
    Mytype = Type;
  }

  @override
  _TikTacToeGameState createState() => _TikTacToeGameState();
}

int Mytype = 0;

class _TikTacToeGameState extends State<TikTacToeGame> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SelectedArray.add(0);
    SelectedArray.add(0);
    SelectedArray.add(0);
    SelectedArray.add(0);
    SelectedArray.add(0);
    SelectedArray.add(0);
    SelectedArray.add(0);
    SelectedArray.add(0);
    SelectedArray.add(0);
  }

  bool Final = false;

  List<int> SelectedArray = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: //Text('$Mytype')
            (Final == false)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectedColumn(0),
                          SelectedColumn(1),
                          SelectedColumn(2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectedColumn(3),
                          SelectedColumn(4),
                          SelectedColumn(5),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectedColumn(6),
                          SelectedColumn(7),
                          SelectedColumn(8),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                    WinText,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 70,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  )));
  }

  List<int> positionArray = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  int chance = 0;
  var rng = new Random();

  void ComputerPlay() {
    if (chance < 9) {
      //ComputerAI();
      int a = ComputerAI(); //rng.nextInt(positionArray.length);
      SelectedTexture[positionArray[a]] = RetrieveTexture(computer: true);
      SelectedArray[positionArray[a]] = 1;
      positionArray.remove(positionArray[a]);
      chance++;
      print("Comp:" +
          positionArray.toString() +
          "   ,Chance:" +
          chance.toString());

      //ComputerAI();
      setState(() {});
    }
  }

  String WinText = "";

  int ComputerAI() {
    List<int> positions = new List();
    String CirclePosition = "";
    String CrossPosition = "";

    for (int i = 0; i < SelectedTexture.length; i++) {
      if (SelectedTexture[i].contains("Circle")) {
        positions.add(1);
        CirclePosition += i.toString();
      } else {
        if (SelectedTexture[i].contains("Cross")) {
          positions.add(2);
          CrossPosition += i.toString();
        } else {
          positions.add(0);
        }
      }
    }

    bool Opposite=false;
    CirclePosition = SortingPosition(CirclePosition);
    CrossPosition = SortingPosition(CrossPosition);
    print("Checkmark    -------------------------------------------->  " +
        BingoLocation.length.toString());

    for (int i = 0; i < BingoLocation.length; i++) {
      if (BingoLocation[i] == CirclePosition ||
          CirclePosition.contains(BingoLocation[i])) {
        Final = true;
        if(Mytype==1) {
          WinText = "you Wins";
        }
        else
          {
            WinText = "Opponent Wins";
          }
        //print("CirclePosition:"+Mytype);

        setState(() {});

        //print("you Wins");
        print("Locations:" +
            BingoLocation[i].toString() +
            "   MyLocaiton:" +
            CirclePosition);
      } else {
        if (BingoLocation[i].contains(CirclePosition)) {
          print("element" + BingoLocation[i] + "       Pos:" + CirclePosition);

          String s = BingoLocation[i].replaceAll(CirclePosition, "");
          print(BingoLocation[i] +
              "    ,Remaining Value:" +
              s +
              "    ,Length:" +
              s.length.toString());
          int retnumber = int.parse(s[rng.nextInt(s.length)]);
          print("retnumber: " + retnumber.toString());
          //return retnumber;
        }
      }
      if (BingoLocation[i] == CrossPosition ||
          CrossPosition.contains(BingoLocation[i])) {
        Final = true;
        setState(() {});
        if(Mytype==1) {
          WinText = "Opponent Wins";
        }
        else
        {
          WinText = "you Wins";
        }
        print("Locations:" +
            BingoLocation[i].toString() +
            "   MyLocaiton:" +
            CrossPosition);
      } else {
        if (BingoLocation[i].contains(CrossPosition)) {
          print("element" + BingoLocation[i] + "       Pos:" + CrossPosition);

          String s = BingoLocation[i].replaceAll(CrossPosition, "");
          print(BingoLocation[i] +
              "    ,Remaining Value:" +
              s +
              "    ,Length:" +
              s.length.toString());
          int retnumber = int.parse(s[rng.nextInt(s.length)]);
          print("retnumber: " + retnumber.toString());
          //return retnumber;
        }
      }
    }
    return rng.nextInt(positionArray.length);
  }

  String SortingPosition(String positions) {
    int MinNumber = 0;
    //String Number="";
    for (int j = 0; j < positions.length; j++) {
      for (int i = 1; i < positions.length; i++) {
        if (int.parse(positions[MinNumber]) > int.parse(positions[i])) {
          String temp = positions[i];
          positions.replaceAll(positions[i], positions[MinNumber]);
          positions.replaceAll(positions[MinNumber], temp);
        }
      }
    }
    print("Sorted Position:" + positions);
    return positions;
  }

  List<String> BingoLocation = [
    "012",
    "345",
    "678",
    "036",
    "147",
    "258",
    "048",
    "246"
  ];

  List<String> TextureLink = ['Images/Circle.png', 'Images/Cross.png'];
  List<String> SelectedTexture = [
    'Random.png',
    'Random.png',
    'Random.png',
    'Random.png',
    'Random.png',
    'Random.png',
    'Random.png',
    'Random.png',
    'Random.png'
  ];

  //bool computer=false;
  String RetrieveTexture({bool computer = false}) {
    if (computer == false) {
      if (Mytype == 1) {
        return TextureLink[0];
      } else {
        return TextureLink[1];
      }
    } else {
      if (Mytype == 1) {
        return TextureLink[1];
      } else {
        return TextureLink[0];
      }
    }
  }

  Widget SelectedColumn(int Texture) {
    return InkWell(
      onTap: () {
        if (SelectedArray[Texture] == 1) {
          return;
        } else {
          SelectedTexture[Texture] = RetrieveTexture();
          SelectedArray[Texture] = 1;
          positionArray.remove(Texture);

          chance++;
          print("Chance: " + chance.toString());
          print(positionArray);
          ComputerPlay();
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.27,
            height: MediaQuery.of(context).size.width * 0.27,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.teal, spreadRadius: 1, blurRadius: 5)
                ]),
            child: (SelectedArray[Texture] == 1)
                ? Image.asset(SelectedTexture[Texture])
                : Container()),
      ),
    );
  }
}
