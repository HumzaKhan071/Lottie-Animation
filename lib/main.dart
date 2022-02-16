import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_animation/second_practice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SecondPractice());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isAnimating = false;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie Animations"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_rjgikbck.json",
              controller: _controller, onLoaded: (composition) {
            _controller.duration = composition.duration;
            // _controller.repeat();
          }),
          TextButton(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                  setState(() {
                    isAnimating = false;
                  });
                } else {
                  _controller.forward();
                  setState(() {
                    isAnimating = true;
                  });
                }
              },
              child: Text(isAnimating ? "Stop" : "Play"))
        ],
      ),
    );
  }
}
