import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube Player',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const YouTubePlayerScreen(videoId: 'QdBZY2fkU-0'), // Передаём ID видео
    );
  }
}

class YouTubePlayerScreen extends StatelessWidget {
  final String videoId; // Поле для хранения идентификатора видео

  const YouTubePlayerScreen({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Используем переданный идентификатор
    final controller = YoutubePlayerController(
      initialVideoId: videoId,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Player'),
      ),
      body: Center(
        child: YoutubePlayerIFrame(
          controller: controller,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
