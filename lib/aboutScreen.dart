import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Developed By:',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/SoftElit.png'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'This Application Lets you Track Corona Virus Cases Country Wise and Globally',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
