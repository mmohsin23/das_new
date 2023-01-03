// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:example/authentication_control.dart';

//FIREBASE LIBRARIES
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//SPEECH TO TEXT LIBRARIES
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:math';

///CSV LIBRARIES
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:avatar_glow/avatar_glow.dart';

//PYTHON LIBRARIES
import 'package:http/http.dart' as http;
import 'package:example/apiDAS.dart';
import 'dart:convert';

//GRADIENT LIBRARIES
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String nameCurrent = '';
  String emailCurrent = '';
  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var retinfo = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.email)
        .get();
    setState(() {
      nameCurrent = retinfo.data()!["Name: "];
      emailCurrent = retinfo.data()!["Email: "];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List calls = [
      "Voice Call",
      "Face Call",
    ];

    return SafeArea(
      child: Scaffold(
        appBar: NewGradientAppBar(
          centerTitle: true,
          title: const Text('DAS APP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          gradient: LinearGradient(colors: [
            Colors.orange.shade400,
            Colors.pink.shade400,
          ]),
        ),
        body: Column(children: [
          const SizedBox(height: 30),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 8, right: 8),
            height: 260,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Colors.blueAccent,
                  Colors.tealAccent,
                ]),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Welcome ' + nameCurrent,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  width: double.infinity,
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VoicePage())),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              scale: 0.8,
                              image: AssetImage("img/vcall.png"),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VoicePage())),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              scale: 0.8,
                              image: AssetImage("img/fcall.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: w,
                  child: Center(
                    child: Wrap(
                      children: List<Widget>.generate(2, (index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              width: 150,
                              height: 35,
                              child: Text(
                                calls[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ));
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: const DecorationImage(
                  image: AssetImage("img/loginbtn.png"),
                  fit: BoxFit.cover,
                )),
            child: FlatButton(
              minWidth: w * 0.50,
              height: h * 0.08,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              color: Colors.transparent,
              onPressed: () => DasAuth.instance.logout(),
              child: const Text(
                "Sign out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            width: w,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.orange.shade400,
                Colors.pink.shade400,
              ]),
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        scale: 0.8,
                        image: AssetImage("img/bprofile.png"),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        scale: 0.8,
                        image: AssetImage("img/bfiles.png"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 03),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        scale: 0.8,
                        image: AssetImage("img/bsettings.png"),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

class VoicePage extends StatefulWidget {
  const VoicePage({Key? key}) : super(key: key);
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  List<dynamic> dataD = [];
  List<dynamic> dataA = [];
  List<dynamic> dataS = [];
  String url = '';
  var dataurl = '';
  String getQuery = '';

  Future getDataURL(url) async {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  fetchFileData() async {
    final responsetext = await rootBundle.loadString("questions.csv");
    List<List<dynamic>> listview =
        const CsvToListConverter().convert(responsetext);

    setState(() {
      int dasstart = 0;
      for (int daslist = 0; daslist < 42; daslist++) {
        if (listview[daslist][2] == 'D') {
          dataD.add(listview[daslist][1]);
        } else if (listview[daslist][2] == 'A') {
          dataA.add(listview[daslist][1]);
        } else if (listview[daslist][2] == 'S') {
          dataS.add(listview[daslist][1]);
        }
      }
    });
  }

  int iD = Random().nextInt(8);
  int iA = Random().nextInt(16);
  int iS = Random().nextInt(18);

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';

  @override
  void initState() {
    fetchFileData();
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: GradientText(
                'Voice Call Session',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                colors: [
                  Colors.deepOrangeAccent,
                  Colors.orange,
                  Colors.pink.shade300,
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 500,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Container(
                    width: w,
                    margin: const EdgeInsets.only(right: 7, left: 7, top: 10),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff9cdc2c)),
                    child: Text(
                      dataS[iS],
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 7, left: 7, top: 10),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff9cdc2c)),
                    child: Text(
                      _text,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: AvatarGlow(
                animate: _isListening,
                glowColor: Colors.deepOrangeAccent,
                endRadius: 50,
                duration: const Duration(milliseconds: 2000),
                repeatPauseDuration: const Duration(milliseconds: 100),
                repeat: true,
                child: FloatingActionButton(
                  onPressed: _listen,
                  child: Icon(_isListening ? Icons.mic : Icons.mic_none),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30, top: 40),
              width: w * 0.50,
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.red,
                // image: const DecorationImage(
                //   scale: 1.5,
                //   image: AssetImage("img/ecall.png"),
                //   fit: BoxFit.cover,
                // )
              ),
              child: FlatButton(
                minWidth: w * 0.4,
                height: h * 0.06,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                color: Colors.transparent,
                onPressed: () =>
                    Navigator.pop(context), // DasAuth.instance.logout(),
                child: const Icon(
                  Icons.call_end,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {}
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      url = 'http://10.0.2.2:8000/api?text=' + _text;
      dataurl = await getDataURL(url);
      var decodedData = jsonDecode(dataurl);
      print(decodedData['label']);
    }
  }
}
