import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;
    addCube(arCoreController);
    //sceneSetting(arCoreController);
  }

  void sceneSetting(ArCoreView view) {
    
  }

  void addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.blue,
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.4, 0.4, 0.4),
    );
    final node = ArCoreRotatingNode(
      shape: cube,
      position: vector.Vector3(0, 0, -1.0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );
    controller.add(node);
  }
}
