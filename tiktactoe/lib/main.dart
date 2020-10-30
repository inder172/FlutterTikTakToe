import 'package:flutter/material.dart';
import 'package:tiktactoe/TikTacToeGame.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ShowOption());
  }
}


int SelectedNumber=0;


class ShowOption extends StatefulWidget {
  @override
  _ShowOptionState createState() => _ShowOptionState();
}

int BackButton=0;
class _ShowOptionState extends State<ShowOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
                "TikTacToe      ",
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w700,fontSize: 25),
              )),
          elevation: 20,
          backgroundColor: Colors.white,centerTitle: true,leading:
        (BackButton!=0)?
            IconButton(onPressed: (){
            if(BackButton>=1)
              {
                SelectedNumber=0;
                BackButton=0;
                setState(() {

                });
              }

            },icon: Icon(Icons.arrow_back_ios,color: Colors.redAccent,size: 30,),):
            Container()

        ),
        body:
        (SelectedNumber==0)?
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose option',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700,color: Colors.teal),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(onTap: (){
                    SelectedNumber=1;
                    BackButton=1;
                    setState(() {

                    });
                  },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      height: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.red,
                                spreadRadius: 1,
                                blurRadius: 5)
                          ]),
                      child: Image.asset('Images/Circle.png'),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(onTap: (){
                    SelectedNumber=2;
                    BackButton=2;
                    setState(() {

                    });
                  },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                      height: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 5)
                          ]),
                      child: Image.asset('Images/Cross.png'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 80,),
            ],
          ),
        ):
        TikTacToeGame(Type: SelectedNumber,)
    );
  }
}

