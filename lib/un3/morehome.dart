import 'package:flutter/material.dart';

class Newhome extends StatefulWidget {
  const Newhome({super.key});

  @override
  State<Newhome> createState() => _homeState();
}

class _homeState extends State<Newhome> {
  String _gestureDetected = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            _GestureDetector(),
            Divider(
              color: Colors.black,
              height: 44.0,
            ),
            _Draggable(),
            Divider(
              height: 40.0,
            ),
            _DragTarget(),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      )),
    );
  }

  GestureDetector _GestureDetector() {
    return GestureDetector(
      onTap: () {
        print('ontap');
        _displayGD('onTap');
      },
      onDoubleTap: () {
        print('doubletap');
        _displayGD('doubletap');
      },
      onLongPress: () {
        print('longpress');
        _displayGD('longpress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGD('onPanUpdate:\n$details');
      },
      onVerticalDragUpdate: ((DragUpdateDetails details) {
        print('onVerticalDragUpdate: $details');
        _displayGD('onVerticalDragUpdate:\n$details');
      }),
/*       onHorizontalDragUpdate: (DragUpdateDetails details) {
        print('onHorizontalDragUpdate: $details');
        _displayGD('onHorizontalDragUpdate:\n$details');
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        print('onHorizontalDragEnd: $details');
        if (primaryVelocity < 0) {
          print('Dragging Right to Left: ${details.velocity}');
        } else if (primaryVelocity > 0) {
          print('Dragging Left to Right: ${details.velocity}');
        }
      }, */
      child: Column(
        children: [
          Icon(
            Icons.access_alarm,
            size: 98.0,
          ),
          Text('$_gestureDetected')
        ],
      ),
    );
  }

  void _displayGD(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _Draggable() {
    return Draggable(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.palette,
            color: Color.fromARGB(255, 214, 129, 30),
            size: 48.0,
          ),
          Text(
            'color',
          ),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Color.fromARGB(255, 209, 94, 27),
        size: 80.0,
      ),
      data: Color.fromARGB(220, 209, 77, 20).value,
    );
  }

  DragTarget<int> _DragTarget() {
    return DragTarget<int>(
      onAccept: (colorValue) {},
      builder: (BuildContext context, List<dynamic> acceptedData,
              List<dynamic> rejectedData) =>
          acceptedData.isEmpty
              ? Text(
                  'color',
                  style: TextStyle(color: Colors.deepOrange),
                )
              : Text(
                  'Painting Color: $acceptedData',
                  style: TextStyle(
                    color: Color(acceptedData[0]),
                    fontWeight: FontWeight.bold,
                  ),
                ),
    );
  }
}
