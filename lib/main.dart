import 'package:flutter/material.dart';
import 'stream.dart'; // Pastikan file ini ada di direktori yang sesuai.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dynamic Color Stream",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgcolor = Colors.purple;
  final ColorStream colorStream = ColorStream();

  @override
  void initState() {
    super.initState();
    changeBackgroundColor();
  }

  void changeBackgroundColor() async {
    await for (var color in colorStream.getColors()) {
      setState(() {
        bgcolor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgcolor,
        ),
      ),
    );
  }
}
