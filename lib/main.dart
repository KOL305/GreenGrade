
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
typedef PrintArrayC = Void Function(Array<Double>, Int32);
typedef PrintArrayDart = void Function(Array<Double>, int);



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FFI Example'),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 callCFunction();
//               },
//               child: Text('Call C++ Function'),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => QRScanner()));
//             },
//             child: Text('Open Scanner'),
//           ),
//         ],
//       ),
//     );
//   }
// }

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



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Owners'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Define controllers for each text field
  final TextEditingController _totalWaterWithdrawalMinController = TextEditingController();
  final TextEditingController _totalWaterWithdrawalMaxController = TextEditingController();
  final TextEditingController _dischargedWaterMinController = TextEditingController();
  final TextEditingController _dischargedWaterMaxController = TextEditingController();
  final TextEditingController _reusedWaterMinController = TextEditingController();
  final TextEditingController _reusedWaterMaxController = TextEditingController();
  final TextEditingController _reductionFreshwaterMinController = TextEditingController();
  final TextEditingController _reductionFreshwaterMaxController = TextEditingController();
  final TextEditingController _ghgEmissionsMinController = TextEditingController();
  final TextEditingController _ghgEmissionsMaxController = TextEditingController();
  final TextEditingController _airEmissionsMinController = TextEditingController();
  final TextEditingController _airEmissionsMaxController = TextEditingController();
  final TextEditingController _reductionGhgMinController = TextEditingController();
  final TextEditingController _reductionGhgMaxController = TextEditingController();
  final TextEditingController _energyNonrenewableMinController = TextEditingController();
  final TextEditingController _energyNonrenewableMaxController = TextEditingController();
  final TextEditingController _energyRenewableMinController = TextEditingController();
  final TextEditingController _energyRenewableMaxController = TextEditingController();
  final TextEditingController _totalWasteGeneratedMinController = TextEditingController();
  final TextEditingController _totalWasteGeneratedMaxController = TextEditingController();
  final TextEditingController _wasteRecycledMinController = TextEditingController();
  final TextEditingController _wasteRecycledMaxController = TextEditingController();
  final TextEditingController _hazardousWasteMinController = TextEditingController();
  final TextEditingController _hazardousWasteMaxController = TextEditingController();
  final TextEditingController _debtEquityRatioMinController = TextEditingController();
  final TextEditingController _debtEquityRatioMaxController = TextEditingController();
  final TextEditingController _medianSalaryMinController = TextEditingController();
  final TextEditingController _medianSalaryMaxController = TextEditingController();
  final TextEditingController _marketCapMinController = TextEditingController();
  final TextEditingController _marketCapMaxController = TextEditingController();
  final TextEditingController _freshwaterConsumptionMinController = TextEditingController();
  final TextEditingController _freshwaterConsumptionMaxController = TextEditingController();  
  final TextEditingController _numberOfEmployeesMinController = TextEditingController();
  final TextEditingController _numberOfEmployeesMaxController = TextEditingController();

  void _clearFields() {
    _totalWaterWithdrawalMinController.clear();
    _totalWaterWithdrawalMaxController.clear();
    _dischargedWaterMinController.clear();
    _dischargedWaterMaxController.clear();
    _reusedWaterMinController.clear();
    _reusedWaterMaxController.clear();
    _reductionFreshwaterMinController.clear();
    _reductionFreshwaterMaxController.clear();
    _ghgEmissionsMinController.clear();
    _ghgEmissionsMaxController.clear();
    _airEmissionsMinController.clear();
    _airEmissionsMaxController.clear();
    _reductionGhgMinController.clear();
    _reductionGhgMaxController.clear();
    _energyNonrenewableMinController.clear();
    _energyNonrenewableMaxController.clear();
    _energyRenewableMinController.clear();
    _energyRenewableMaxController.clear();
    _totalWasteGeneratedMinController.clear();
    _totalWasteGeneratedMaxController.clear();
    _wasteRecycledMinController.clear();
    _wasteRecycledMaxController.clear();
    _hazardousWasteMinController.clear();
    _hazardousWasteMaxController.clear();
    _debtEquityRatioMinController.clear();
    _debtEquityRatioMaxController.clear();
    _medianSalaryMinController.clear();
    _medianSalaryMaxController.clear();
    _marketCapMinController.clear();
    _marketCapMaxController.clear();
    _freshwaterConsumptionMinController.clear();
    _freshwaterConsumptionMaxController.clear();
    _numberOfEmployeesMinController.clear();
    _numberOfEmployeesMaxController.clear();
  }

  void _validateAndSubmit() {
    // Helper function to check if max is less than min
    bool isValid = true;
    String errorMessage = '';

    bool checkMinMax(TextEditingController minController, TextEditingController maxController) {
      if (minController.text.isEmpty || maxController.text.isEmpty) return true; // Skip empty fields

      final double? minValue = double.tryParse(minController.text);
      final double? maxValue = double.tryParse(maxController.text);

      if (minValue == null || maxValue == null || maxValue < minValue) {
        isValid = false;
        return false;
      }
      return true;
    }
    
    bool checkEmpty(TextEditingController minController, TextEditingController maxController) {
      if(minController.text.isEmpty || maxController.text.isEmpty) {
        return false;
      }
      return true;
    }

    // Validate each pair of min and max fields
    if (!checkMinMax(_totalWaterWithdrawalMinController, _totalWaterWithdrawalMaxController) ||
        !checkMinMax(_dischargedWaterMinController, _dischargedWaterMaxController) ||
        !checkMinMax(_reusedWaterMinController, _reusedWaterMaxController) ||
        !checkMinMax(_reductionFreshwaterMinController, _reductionFreshwaterMaxController) ||
        !checkMinMax(_ghgEmissionsMinController, _ghgEmissionsMaxController) ||
        !checkMinMax(_airEmissionsMinController, _airEmissionsMaxController) ||
        !checkMinMax(_reductionGhgMinController, _reductionGhgMaxController) ||
        !checkMinMax(_energyNonrenewableMinController, _energyNonrenewableMaxController) ||
        !checkMinMax(_energyRenewableMinController, _energyRenewableMaxController) ||
        !checkMinMax(_totalWasteGeneratedMinController, _totalWasteGeneratedMaxController) ||
        !checkMinMax(_wasteRecycledMinController, _wasteRecycledMaxController) ||
        !checkMinMax(_hazardousWasteMinController, _hazardousWasteMaxController) ||
        !checkMinMax(_debtEquityRatioMinController, _debtEquityRatioMaxController) ||
        !checkMinMax(_medianSalaryMinController, _medianSalaryMaxController) ||
        !checkMinMax(_marketCapMinController, _marketCapMaxController) ||
        !checkMinMax(_freshwaterConsumptionMinController,_freshwaterConsumptionMaxController) ||
        !checkMinMax(_numberOfEmployeesMinController,_numberOfEmployeesMaxController)) {
      setState(() {
        errorMessage = 'Max value should be greater than or equal to Min value for all fields.';
      });
    } else {
      setState(() {
        errorMessage = '';
      });
      // Handle submission logic here
    }
    if (!checkEmpty(_totalWaterWithdrawalMinController, _totalWaterWithdrawalMaxController) ||
        !checkEmpty(_dischargedWaterMinController, _dischargedWaterMaxController) ||
        !checkEmpty(_reusedWaterMinController, _reusedWaterMaxController) ||
        !checkEmpty(_reductionFreshwaterMinController, _reductionFreshwaterMaxController) ||
        !checkEmpty(_ghgEmissionsMinController, _ghgEmissionsMaxController) ||
        !checkEmpty(_airEmissionsMinController, _airEmissionsMaxController) ||
        !checkEmpty(_reductionGhgMinController, _reductionGhgMaxController) ||
        !checkEmpty(_energyNonrenewableMinController, _energyNonrenewableMaxController) ||
        !checkEmpty(_energyRenewableMinController, _energyRenewableMaxController) ||
        !checkEmpty(_totalWasteGeneratedMinController, _totalWasteGeneratedMaxController) ||
        !checkEmpty(_wasteRecycledMinController, _wasteRecycledMaxController) ||
        !checkEmpty(_hazardousWasteMinController, _hazardousWasteMaxController) ||
        !checkEmpty(_debtEquityRatioMinController, _debtEquityRatioMaxController) ||
        !checkEmpty(_medianSalaryMinController, _medianSalaryMaxController) ||
        !checkEmpty(_marketCapMinController, _marketCapMaxController) ||
        !checkEmpty(_freshwaterConsumptionMinController,_freshwaterConsumptionMaxController) ||
        !checkEmpty(_numberOfEmployeesMinController,_numberOfEmployeesMaxController)) {
      setState(() {
        errorMessage = 'All fields must be populated.';
      });
    }

    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
    else {
      _setIndicatorVals();
      callCFunction();
      //navigate to sii finish page
    }
    //submission logic

  
  }
double minVal=-1;
double maxVal=-1;

List<double> arrStringToDoub(List<String> arr) {
  List<double> returnArr = [];
  for(int i =0;i<arr.length;i++) {
    returnArr[i]=double.parse(arr[i]);
  }
  return returnArr;
}

void callCFunction() {
  final DynamicLibrary nativeLib = Platform.isAndroid
      ? DynamicLibrary.open('libexample.so')
      : DynamicLibrary.process();
// test array, u will have to use the one from gemini
  
    List<double> doubleIndicatorVals = arrStringToDoub(indicatorVals);
 // Allocate memory for the array in native memory
    final Pointer<Double> nativeArray = malloc<Double>(doubleIndicatorVals.length);

    // Copy Dart array to native memory
    for (int i = 0; i < doubleIndicatorVals.length; i++) {
      nativeArray[i] = doubleIndicatorVals[i];
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
  minVal=getMin();
  maxVal=getMax();
  print(getMin());
  print(getMax());
}

String? _fileName;
String? _filePath;
  void _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final file = result.files.first;
      
      setState(() {
        _fileName = file.name;
        _filePath = file.path;
      });
    print(_fileName);
    print(_filePath);

      // You can access the file path using file.path
      // File fileToUpload = File(file.path!);
    } else {
      // User canceled the picker
    }
  }
  List<String> indicatorVals=[];
  void _setIndicatorVals() async {
    
    double numEmployees=(double.parse(_numberOfEmployeesMinController.text) + double.parse(_numberOfEmployeesMaxController.text))/2;
    indicatorVals[0]= (double.parse(_totalWaterWithdrawalMinController.text)/numEmployees).toString();
    indicatorVals[1]= (double.parse(_totalWaterWithdrawalMaxController.text)/numEmployees).toString();
    indicatorVals[2]= (double.parse(_dischargedWaterMinController.text)/numEmployees).toString();
    indicatorVals[3]= (double.parse(_dischargedWaterMaxController.text)/numEmployees).toString();
    indicatorVals[4]=_reusedWaterMinController.text;
    indicatorVals[5]=_reusedWaterMaxController.text;
    indicatorVals[6]=_reductionFreshwaterMinController.text;
    indicatorVals[7]=_reductionFreshwaterMaxController.text;
    indicatorVals[8]= (double.parse(_ghgEmissionsMinController.text)/numEmployees).toString();
    indicatorVals[9]= (double.parse(_ghgEmissionsMaxController.text)/numEmployees).toString();
    indicatorVals[10]= (double.parse(_airEmissionsMinController.text)/numEmployees).toString();
    indicatorVals[11]= (double.parse(_airEmissionsMaxController.text)/numEmployees).toString();
    indicatorVals[12]=_reductionGhgMinController.text;
    indicatorVals[13]=_reductionGhgMaxController.text;
    indicatorVals[14]= (double.parse(_energyNonrenewableMinController.text)/numEmployees).toString();
    indicatorVals[15]= (double.parse(_energyNonrenewableMaxController.text)/numEmployees).toString();
    indicatorVals[16]=_energyRenewableMinController.text;
    indicatorVals[17]=_energyRenewableMaxController.text;
    indicatorVals[18]= (double.parse(_totalWasteGeneratedMinController.text)/numEmployees).toString();
    indicatorVals[19]= (double.parse(_totalWasteGeneratedMaxController.text)/numEmployees).toString();
    indicatorVals[20]= (double.parse(_wasteRecycledMinController.text)/numEmployees).toString();
    indicatorVals[21]= (double.parse(_wasteRecycledMaxController.text)/numEmployees).toString();
    indicatorVals[22]= (double.parse(_hazardousWasteMinController.text)/numEmployees).toString();
    indicatorVals[23]= (double.parse(_hazardousWasteMaxController.text)/numEmployees).toString();
    indicatorVals[24]=_debtEquityRatioMinController.text;
    indicatorVals[25]=_debtEquityRatioMaxController.text;
    indicatorVals[26]=_medianSalaryMinController.text;
    indicatorVals[27]=_medianSalaryMaxController.text;
    indicatorVals[28]= (double.parse(_marketCapMinController.text)/numEmployees).toString();
    indicatorVals[29]= (double.parse(_marketCapMaxController.text)/numEmployees).toString();
    indicatorVals[30]= (double.parse(_freshwaterConsumptionMinController.text)/numEmployees).toString();
    indicatorVals[31]= (double.parse(_freshwaterConsumptionMaxController.text)/numEmployees).toString();
  }
  void _findIndicatorVals() async {
    //GEMINI STUFF (use _fileName)
    List<String> indicators = ['234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234','234'];
    _totalWaterWithdrawalMinController.text=indicators[0];
    _totalWaterWithdrawalMaxController.text=indicators[1];
    _dischargedWaterMinController.text=indicators[2];
    _dischargedWaterMaxController.text=indicators[3];
    _reusedWaterMinController.text=indicators[4];
    _reusedWaterMaxController.text=indicators[5];
    _reductionFreshwaterMinController.text=indicators[6];
    _reductionFreshwaterMaxController.text=indicators[7];
    _ghgEmissionsMinController.text=indicators[8];
    _ghgEmissionsMaxController.text=indicators[9];
    _airEmissionsMinController.text=indicators[10];
    _airEmissionsMaxController.text=indicators[11];
    _reductionGhgMinController.text=indicators[12];
    _reductionGhgMaxController.text=indicators[13];
    _energyNonrenewableMinController.text=indicators[14];
    _energyNonrenewableMaxController.text=indicators[15];
    _energyRenewableMinController.text=indicators[16];
    _energyRenewableMaxController.text=indicators[17];
    _totalWasteGeneratedMinController.text=indicators[18];
    _totalWasteGeneratedMaxController.text=indicators[19];
    _wasteRecycledMinController.text=indicators[20];
    _wasteRecycledMaxController.text=indicators[21];
    _hazardousWasteMinController.text=indicators[22];
    _hazardousWasteMaxController.text=indicators[23];
    _debtEquityRatioMinController.text=indicators[24];
    _debtEquityRatioMaxController.text=indicators[25];
    _medianSalaryMinController.text=indicators[26];
    _medianSalaryMaxController.text=indicators[27];
    _marketCapMinController.text=indicators[28];
    _marketCapMaxController.text=indicators[29];
    _freshwaterConsumptionMinController.text=indicators[30];
    _freshwaterConsumptionMaxController.text=indicators[31];
    _numberOfEmployeesMinController.text=indicators[32];
    _numberOfEmployeesMaxController.text=indicators[33];
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11221d), // Dark color to match the background
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Color(0xFF62ffac)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Menu Icon at the top of the sidebar
              ListTile(
                leading: Icon(Icons.menu, color: Color(0xFF62ffac)),
              ),
              // Home option
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  //Navigation
                },
              ),
              // Sustainability Interval Calculator option
              ListTile(
                title: Text(
                  'Sustainability Interval Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              // Gemini Index Generator option (now 3rd)
              ListTile(
                title: Text(
                  'Gemini Index Generator',
                  style: TextStyle(
                    color: Color(0xFF62ffac),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              // QR Code Compressor option
              ListTile(
                title: Text(
                  'QR Code Compressor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
              // QR Code Scanner option
              ListTile(
                title: Text(
                  'QR Code Scanner',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Handle navigation
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF11221d), Color(0xFF000000)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: Color(0xFF62ffac),
                        thickness: 2,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      'Gemini Input Form',
                      style: TextStyle(
                        color: Color(0xFF62ffac),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Divider(
                        color: Color(0xFF62ffac),
                        thickness: 2,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Upload sustainability or ESG report for desired company.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                       padding: EdgeInsets.all(15),
                 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(  
                      onPressed: _pickPDF,
                      child: const Text('Upload PDF',
                      style: TextStyle(color: Color(0xFF11221d),)),
                    ),],),),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                    ElevatedButton(                  
                      onPressed: _findIndicatorVals,
                      child: const Text('Find Indicator Values',
                      style: TextStyle(color: Color(0xff11221d),)
                      ),
                      
                      )
                  ]
                )),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFFFFF), Color(0xFF62ffac)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Indicator Input Form',
                        style: TextStyle(
                          color: Color(0xFF0b1411),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      inputField("Total Water Withdrawal", "Cubic Meters", _totalWaterWithdrawalMinController, _totalWaterWithdrawalMaxController,'',''),
                      inputField("Discharged Water", "Cubic Meters", _dischargedWaterMinController, _dischargedWaterMaxController,'',''),
                      inputField("Reused or Treated Water", "Percent of Total Water Use", _reusedWaterMinController, _reusedWaterMaxController,'',''),
                      inputField("Reduction in Freshwater Consumption", "Percent Reduction", _reductionFreshwaterMinController, _reductionFreshwaterMaxController,'',''),
                      inputField("GHG Emissions", "Kg CO2 Equivalent", _ghgEmissionsMinController, _ghgEmissionsMaxController,'',''),
                      inputField("Air Emissions", "Metric Tons", _airEmissionsMinController, _airEmissionsMaxController,'',''),
                      inputField("Reduction in GHG", "Percent Reduction", _reductionGhgMinController, _reductionGhgMaxController,'',''),
                      inputField("Energy from Nonrenewable Sources", "Joules", _energyNonrenewableMinController, _energyNonrenewableMaxController,'',''),
                      inputField("Energy from Renewable Sources", "Percent of Total Energy Use", _energyRenewableMinController, _energyRenewableMaxController,'',''),
                      inputField("Total Waste Generated", "Metric Tons", _totalWasteGeneratedMinController, _totalWasteGeneratedMaxController,'',''),
                      inputField("Waste Recycled", "Metric Tons", _wasteRecycledMinController, _wasteRecycledMaxController,'',''),
                      inputField("Hazardous Waste", "Metric Tons", _hazardousWasteMinController, _hazardousWasteMaxController,'',''),
                      inputField("Debt to Equity Ratio", "Units N/A", _debtEquityRatioMinController, _debtEquityRatioMaxController,'',''),
                      inputField("Median Salary", "USD", _medianSalaryMinController, _medianSalaryMaxController,'',''),
                      inputField("Market Cap", "USD", _marketCapMinController, _marketCapMaxController,'',''),
                      inputField("Freshwater Consumption", "Cubic Meters", _freshwaterConsumptionMinController, _freshwaterConsumptionMaxController,'',''),
                      inputField("Number of Employees", "Units N/A", _numberOfEmployeesMinController, _numberOfEmployeesMaxController,'',''),
                
                      SizedBox(height: 20),
                      
                     
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: _clearFields,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF62ffac)),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        'Clear Fields',
                        style: TextStyle(color: Color(0xFF62ffac)),
                      ),
                    ),
                    SizedBox(width: 20),
                    OutlinedButton(
                      onPressed: _validateAndSubmit,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF62ffac)),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Color(0xFF62ffac)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField(String label, String unit, TextEditingController minController, TextEditingController? maxController, String inputA, String inputB) {
         minController.text=inputA;
         if(maxController!=null) {maxController.text=inputB;}

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text('$label: $unit'),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: minController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'-?\d*\.?\d*'))],
                decoration: InputDecoration(
                  labelText: 'Min',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(width: 10),
            maxController != null
                ? Expanded(
                    child: TextField(
                      controller: maxController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'-?\d*\.?\d*'))],
                      decoration: InputDecoration(
                        labelText: 'Max',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                : Container(), // If there's no max controller, don't show the max field
          ],
        ),
      ],
    );
  }
}
