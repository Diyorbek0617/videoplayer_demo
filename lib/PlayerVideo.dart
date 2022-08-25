import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'about.dart';

class PlayerVideo extends StatefulWidget {
  const PlayerVideo({Key? key}) : super(key: key);
  static const String id = "PlayerVideo";

  @override
  State<PlayerVideo> createState() => _PlayerVideoState();
}

class _PlayerVideoState extends State<PlayerVideo> {
  String video = "assets/videos/insta1.mp4";
  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = VideoPlayerController.asset(video)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Player",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              About(context);
            },
            icon: const Icon(Icons.perm_device_info),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: controller!=null &&controller!.value.isInitialized?Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          ):const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildVideo()=>buildVideoPlayer();
  Widget buildVideoPlayer()=>AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: VideoPlayer(controller!));
}
