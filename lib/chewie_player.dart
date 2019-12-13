import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/iconfont.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({Key key}) : super(key: key);

  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    //配置视频地址
    // videoPlayerController = VideoPlayerController.file(File('/Users/noah/Downloads/190204084208765161.mp4'))..initialize().then((_){
    //   videoPlayerController.play();
    // });
    // videoPlayerController = VideoPlayerController.asset('images/190204084208765161.mp4')..initialize().then((_){
    //   videoPlayerController.play();
    // });
    videoPlayerController = VideoPlayerController.network('http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4')..initialize().then((_){
      videoPlayerController.play();
    });
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2, //宽高比
      autoPlay: true, //自动播放
      looping: true, //循环播放
    );
    print(videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

      home: Scaffold(
      appBar: AppBar(
        title: Text("视频播放器")
        
        ),
      body: Center(
        //视频播放器
        child: Column(
          children: <Widget>[
            Chewie(
          controller: chewieController,
        )
        ,
        Icon(IconFont.fangdajing),
        Icon(Icons.face),
        
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    /**
     * 当页面销毁的时候，将视频播放器也销毁
     * 否则，当页面销毁后会继续播放视频！
     */
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}