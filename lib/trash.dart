// class VoicePage extends StatefulWidget {
//   const VoicePage({Key? key}) : super(key: key);
//   _VoicePageState createState() => _VoicePageState();
// }

// class _VoicePageState extends State<VoicePage> {
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//     double h = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body: Container(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: const EdgeInsets.only(left: 15, right: 15),
//               child: GradientText(
//                 'Voice Call Session',
//                 style: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 colors: [
//                   Colors.deepOrangeAccent,
//                   Colors.orange,
//                   Colors.pink.shade300,
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
// //SPEECH WORK HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//               width: double.infinity,
//               height: 400,
//               color: Colors.tealAccent,
//               margin: const EdgeInsets.all(15),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(35),
//                   image: const DecorationImage(
//                     scale: 1.5,
//                     image: AssetImage("img/loginbtn.png"),
//                     fit: BoxFit.cover,
//                   )),
//               child: FlatButton(
//                 minWidth: w * 0.50,
//                 height: h * 0.08,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(35)),
//                 color: Colors.transparent,
//                 onPressed: () {}, // DasAuth.instance.logout(),
//                 child: const Text(''),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 30, right: 30, top: 80),
//               width: w * 0.50,
//               height: h * 0.08,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(35),
//                 color: Colors.red,
//                 // image: const DecorationImage(
//                 //   scale: 1.5,
//                 //   image: AssetImage("img/ecall.png"),
//                 //   fit: BoxFit.cover,
//                 // )
//               ),
//               child: FlatButton(
//                 minWidth: w * 0.4,
//                 height: h * 0.06,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(35)),
//                 color: Colors.transparent,
//                 onPressed: () =>
//                     Navigator.pop(context), // DasAuth.instance.logout(),
//                 child: const Icon(
//                   Icons.call_end,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }

// class SpeechScreen extends StatefulWidget {
//   @override
//   _SpeechScreenState createState() => _SpeechScreenState();
// }

// class _SpeechScreenState extends State<SpeechScreen> {
//   final Map<String, HighlightedWord> _highlights = {
//     'flutter': HighlightedWord(
//       onTap: () => print('flutter'),
//       textStyle: const TextStyle(
//         color: Colors.blue,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'voice': HighlightedWord(
//       onTap: () => print('voice'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'subscribe': HighlightedWord(
//       onTap: () => print('subscribe'),
//       textStyle: const TextStyle(
//         color: Colors.red,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'like': HighlightedWord(
//       onTap: () => print('like'),
//       textStyle: const TextStyle(
//         color: Colors.blueAccent,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     'comment': HighlightedWord(
//       onTap: () => print('comment'),
//       textStyle: const TextStyle(
//         color: Colors.green,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   };

//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = 'Press the button and start speaking';
//   double _confidence = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: _isListening,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 75.0,
//         duration: const Duration(milliseconds: 2000),
//         repeatPauseDuration: const Duration(milliseconds: 100),
//         repeat: true,
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//           child: TextHighlight(
//             text: _text,
//             words: _highlights,
//             textStyle: const TextStyle(
//               fontSize: 32.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _text = val.recognizedWords;
//             if (val.hasConfidenceRating && val.confidence > 0) {
//               _confidence = val.confidence;
//             }
//           }),
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }
// }
