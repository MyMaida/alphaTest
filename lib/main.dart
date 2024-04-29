import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'BrunoAce',
        dialogTheme: DialogTheme(
          backgroundColor: Colors.grey[850],
          elevation: 0,
          iconColor: Colors.white,
        ),
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool rest = false;

  TextEditingController weight = TextEditingController();
  int kg = 100;

  TextEditingController time = TextEditingController();
  int sec = 100;

  TextEditingController rep = TextEditingController();
  int reps = 10;

  Timer? timer;

  void restTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (sec > 0) {
        setState(() {
          sec--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      weight.text = kg.toString();
      time.text = sec.toString();
      rep.text = reps.toString();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HealthTailor',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
        child: Row(
          children: [
            SizedBox(
              width: 550,
              height: 730,
              child: Column(
                children: [
                  Container(
                    height: 75,
                    margin: EdgeInsets.fromLTRB(15, 0, 12, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.grey[850]),
                    child: Center(
                        child: Text(
                      'DeadLift',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    height: 130,
                    margin: EdgeInsets.fromLTRB(15, 0, 12, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.grey[850]),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              kg -= 5;
                              weight.text = kg.toString();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 120,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Color.fromRGBO(0, 117, 255, 1)),
                            child: Center(
                              child: Text(
                                '-5kg',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              child: TextField(
                                style: TextStyle(fontSize: 35),
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    contentPadding: EdgeInsets.only(bottom: 5)),
                                controller: weight,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Text(
                              'Kg',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              kg += 5;
                              weight.text = kg.toString();
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 120,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: Color.fromRGBO(0, 117, 255, 1)),
                            child: Center(
                              child: Text(
                                '+5kg',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    height: 75,
                    margin: EdgeInsets.fromLTRB(15, 0, 12, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.grey[850]),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              child: TextField(
                                style: TextStyle(fontSize: 35),
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    contentPadding: EdgeInsets.only(bottom: 5)),
                                controller: rep,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Text(
                              'reps',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )),
                  ),
                  Container(
                    height: 200,
                    padding: EdgeInsets.fromLTRB(30, 3, 30, 5),
                    margin: EdgeInsets.fromLTRB(15, 0, 12, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.grey[850]),
                    child: Center(
                      child: Column(children: const [
                        Text(
                          'Sets',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1 set',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'kg',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'reps',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            rest = true;
                            restTimer();
                          });
                        },
                        child: rest
                            ? Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 10, 10),
                                width: 254,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color.fromRGBO(255, 33, 33, 1)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 20),
                                        child: Text(
                                          '  Remain\nRest time',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${sec} s',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 35, right: 20.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                showDeleteAllCheckDialog();
                                              },
                                              child: Icon(
                                                Icons.edit_document,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              )
                            : Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 10, 10),
                                width: 254,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color.fromRGBO(0, 117, 255, 1)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Set \nEnd',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showDeleteAllCheckDialog();
                                              },
                                              child: Icon(
                                                Icons.edit_document,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            rest = false;
                            timer?.cancel();
                            sec = 100;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 5, 10),
                          width: 254,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(0, 117, 255, 1)),
                          child: Center(
                              child: Text(
                            '   Next \nexercise',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[850]),
              width: 600,
              height: 720,
            )
          ],
        ),
      ),
    );
  }

  void showDeleteAllCheckDialog() {
    showDialog(
      context: context,
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: AlertDialog(
            title: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Center(
                  child: const Text('Rest Time Set',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.white)),
                ),
              ],
            ),
            content: Container(
              width: 430,
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sec -= 10;
                        time.text = sec.toString();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color.fromRGBO(0, 117, 255, 1)),
                      child: Center(
                        child: Text(
                          '- 10 s',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        child: TextField(
                          style: TextStyle(fontSize: 35),
                          controller: time,
                          decoration: InputDecoration(),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Text(
                        's',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sec += 10;
                        time.text = sec.toString();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color.fromRGBO(0, 117, 255, 1)),
                      child: Center(
                        child: Text(
                          '+ 10 s',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
