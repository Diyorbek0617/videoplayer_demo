import 'package:flutter/material.dart';
import 'package:videoplayer_demo/PlayerVideo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Video Player',
      debugShowCheckedModeBanner: false,
      home: const PlayerVideo(),
      routes: {
        PlayerVideo.id:(context)=>const PlayerVideo(),
      },
    );
  }
}
