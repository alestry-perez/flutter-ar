import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter AR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController _arcoreController) {
    arCoreController = _arcoreController;
    _addCube(arCoreController);
  }

  void _addCube(ArCoreController controller) {
  final material = ArCoreMaterial(
    color: Colors.blue,
    metallic: 1.0,
  );
  final cube = ArCoreCube(
    materials: [material],
    size: vector.Vector3(0.2, 0.2, 0.2),
    
  );
  final node = ArCoreRotatingNode(
    shape: cube,
    position: vector.Vector3(0, 0, -1.5),
    rotation: vector.Vector4(0,0,0,0),
  );
  
  
  controller.add(node);
}

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }
}
