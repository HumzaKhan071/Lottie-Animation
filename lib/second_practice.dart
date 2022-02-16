import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondPractice extends StatefulWidget {
  const SecondPractice({Key? key}) : super(key: key);

  @override
  _SecondPracticeState createState() => _SecondPracticeState();
}

class _SecondPracticeState extends State<SecondPractice>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isAnimting = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              "https://assets10.lottiefiles.com/packages/lf20_oqbuws8x.json",
              controller: _controller, onLoaded: (composition) {
            _controller.duration = composition.duration;
            // _controller.repeat();
          }),
          TextButton(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                  setState(() {
                    isAnimting = false;
                  });
                } else {
                  _controller.repeat();
                  setState(() {
                    isAnimting = true;
                  });
                }
              },
              child: Text(isAnimting ? "Stop" : "Play"))
        ],
      ),
    );
  }
}
