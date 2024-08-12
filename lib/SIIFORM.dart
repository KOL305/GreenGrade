import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';
import 'SIILandingPage.dart';
import 'QRCodeCompressor.dart';
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

class SIIFORM extends StatefulWidget {
  final String title;

  const SIIFORM({Key? key, required this.title}) : super(key: key);

  @override
  _SIIFORMState createState() => _SIIFORMState();
}

class _SIIFORMState extends State<SIIFORM> {
  

  
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
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              // Sustainability Interval Calculator option
              ListTile(
                title: Text(
                  'Sustainability Interval Calculator',
                  style: TextStyle(
                    color: Color(0xFF62ffac),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                //  Navigator.pop(context); // Close the drawer
                //   Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(builder: (context) => SIILandingPage(title: "SII Landing Page")),
                //   );
                },
              ),
              // Gemini Index Generator option (now 3rd)
              ListTile(
                title: Text(
                  'Gemini Index Generator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
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
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => QRCodeCompressorPage()),
                  );
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
                  Navigator.pop(context); // Close the drawer
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
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
                      'SII Input Form',
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
                  'Insert minimum and maximum values for each indicator. Everything is measured annually. Ensure that all inputted data matches given units.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
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
                      inputField("Total Water Withdrawal", "Cubic Meters", _totalWaterWithdrawalMinController, _totalWaterWithdrawalMaxController),
                      inputField("Discharged Water", "Cubic Meters", _dischargedWaterMinController, _dischargedWaterMaxController),
                      inputField("Reused or Treated Water", "Percent of Total Water Use", _reusedWaterMinController, _reusedWaterMaxController),
                      inputField("Reduction in Freshwater Consumption", "Percent Reduction", _reductionFreshwaterMinController, _reductionFreshwaterMaxController),
                      inputField("GHG Emissions", "Kg CO2 Equivalent", _ghgEmissionsMinController, _ghgEmissionsMaxController),
                      inputField("Air Emissions", "Metric Tons", _airEmissionsMinController, _airEmissionsMaxController),
                      inputField("Reduction in GHG", "Percent Reduction", _reductionGhgMinController, _reductionGhgMaxController),
                      inputField("Energy from Nonrenewable Sources", "Joules", _energyNonrenewableMinController, _energyNonrenewableMaxController),
                      inputField("Energy from Renewable Sources", "Percent of Total Energy Use", _energyRenewableMinController, _energyRenewableMaxController),
                      inputField("Total Waste Generated", "Metric Tons", _totalWasteGeneratedMinController, _totalWasteGeneratedMaxController),
                      inputField("Waste Recycled", "Metric Tons", _wasteRecycledMinController, _wasteRecycledMaxController),
                      inputField("Hazardous Waste", "Metric Tons", _hazardousWasteMinController, _hazardousWasteMaxController),
                      inputField("Debt to Equity Ratio", "Units N/A", _debtEquityRatioMinController, _debtEquityRatioMaxController),
                      inputField("Median Salary", "USD", _medianSalaryMinController, _medianSalaryMaxController),
                      inputField("Market Cap", "USD", _marketCapMinController, _marketCapMaxController),
                      inputField("Freshwater Consumption", "Cubic Meters", _freshwaterConsumptionMinController, _freshwaterConsumptionMaxController),
                      inputField("Number of Employees", "Units N/A", _numberOfEmployeesMinController, _numberOfEmployeesMaxController),
                
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

  Widget inputField(String label, String unit, TextEditingController minController, TextEditingController? maxController) {
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


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SIIFORM(title: 'Sustainability Indicator Input Form'),
              ),
            );
          },
          child: Text('Go to SIIFORM'),
        ),
      ),
    );
  }
}

