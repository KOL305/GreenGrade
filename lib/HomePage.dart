import 'package:flutter/material.dart';
//import 'QRCodeCompressor.dart'; // Import the QR Code Compressor file
import 'SIILandingPage.dart'; // Import the SII Landing Page file
import 'GEMINICALCULATOR.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11221d),
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
              ListTile(
                leading: Icon(Icons.menu, color: Color(0xFF62ffac)),
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Color(0xFF62ffac),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
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
                  Navigator.pop(context); // Close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
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
                  print("TO GEMINI calculator");
                   Navigator.pop(context); // Close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GEMINICALCULATOR()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
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
                    'Welcome',
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
                'This application was created by a group of high school students from UCLA COSMOS Cluster 4 with the goal of identifying quantitative sustainability ratings of companies. ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
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
                        'Notable Features',
                        style: TextStyle(
                          color: Color(0xFF0b1411),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Gemini Input Form: Manually input 15 indicator values you already have, or upload a sustainability/ESG report for Gemini to automatically extract 15 indicator values.',
                        style: TextStyle(color: Color(0xFF0b1411)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Company Profile: Read a company’s sustainability summary generated by Gemini by clicking on its respective box. ',
                        style: TextStyle(color: Color(0xFF0b1411)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '- Add and delete companies as desired. ',
                        style: TextStyle(color: Color(0xFF0b1411)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => HomePage()),
                        // );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF62ffac)),
                        minimumSize: Size(200, 50),
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      ),
                      child: Text(
                        'Sustainability Calculator',
                        style: TextStyle(color: Color(0xFF62ffac)),
                      ),
                    ),
                    SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GEMINICALCULATOR()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF62ffac)),
                        minimumSize: Size(200, 50),
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      ),
                      child: Text(
                        'Gemini Index Generator',
                        style: TextStyle(color: Color(0xFF62ffac)),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}