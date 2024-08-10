import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:ffi_gmp_project/qr_scanner.dart';
import 'package:flutter/material.dart';

typedef ExampleFunction = Void Function();
typedef ExampleFunctionDart = void Function();

void main() {
  print("running");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FFI Example'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                callCFunction();
              },
              child: Text('Call C++ Function'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QRScanner()));
            },
            child: Text('Open Scanner'),
          ),
        ],
      ),
    );
  }
}

void callCFunction() {
  final DynamicLibrary nativeLib = Platform.isAndroid
      ? DynamicLibrary.open('libexample.so')
      : DynamicLibrary.process();

  final real =
      nativeLib.lookupFunction<Int32 Function(), int Function()>("real");
  real();

  final getMin =
      nativeLib.lookupFunction<Double Function(), double Function()>("getMin");

  final getMax =
      nativeLib.lookupFunction<Double Function(), double Function()>("getMax");

  print(getMin());
  print(getMax());
}
