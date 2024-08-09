import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';

typedef ExampleFunction = Void Function();
typedef ExampleFunctionDart = void Function();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FFI Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              callCFunction();
            },
            child: Text('Call C++ Function'),
          ),
        ),
      ),
    );
  }
}

void callCFunction() {
  final DynamicLibrary nativeLib = Platform.isAndroid
      ? DynamicLibrary.open('libexample.so')
      : DynamicLibrary.process();

  final ExampleFunctionDart exampleFunction = nativeLib
      .lookup<NativeFunction<ExampleFunction>>('example_function')
      .asFunction();

  exampleFunction();
}
