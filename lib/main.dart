import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var (index, color) in colors.indexed)
                NoteButton(note: 'note${index + 1}.wav', color: color),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteButton extends StatelessWidget {
  final String note;
  final Color color;

  const NoteButton({super.key, required this.note, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          final player = AudioPlayer();
          player.play(AssetSource(note));
        },
        child: const SizedBox(),
      ),
    );
  }
}
