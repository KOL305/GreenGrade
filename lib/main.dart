import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:ffi_gmp_project/qr_scanner.dart';
import 'package:flutter/material.dart';

typedef PrintArrayC = Void Function(Array<Double>, Int32);
typedef PrintArrayDart = void Function(Array<Double>, int);

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
// test array, u will have to use the one from gemini
  final List<double> dartArray = 
  [5932.772365,	5932.77236,
  7673.782108,	7673.782108,
  61.5,	61.5,
  11.75942918,	11.75942918,
  7670504.872,	7670504.872,
  4609.911426,	4609.911426,
  21.07362861,	21.07362861,
  11248893000000,	11248893000000,
  20.6,	20.6,
  3222.763508,	3222.763508,
  224.7121346,	224.7121346,
  1018.689105,	1018.689105,
  0.12,	0.12,
  78944,	101624,
  1211691.763,	1211691.763,
  3333.215235, 3333.215235];

 // Allocate memory for the array in native memory
    final Pointer<Double> nativeArray = malloc<Double>(dartArray.length);

    // Copy Dart array to native memory
    for (int i = 0; i < dartArray.length; i++) {
      nativeArray[i] = dartArray[i];
    }


    // for (int i = 0; i < dartArray.length; i++) {
    // print(nativeArray[i]);
    // }

    // tbh u cud skip this step if its already stored as a pointer, but use this if not

  final setNumbers = nativeLib.lookupFunction<Void Function(Pointer<Double>), void Function(Pointer<Double>)>("correctInputs");

  setNumbers(nativeArray);

  // final getBIints = nativeLib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>("getBIintsConst");
  // final getActual = nativeLib.lookupFunction<Pointer<Utf8> Function(), Pointer<Utf8> Function()>("getActualIntsConst");

  // print(getBIints().toDartString());
  // print("done with i ints");
  // print(getActual().toDartString());


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
