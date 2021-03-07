import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mass/constant/app_constant.dart';
import 'package:mass/widgets/left_bar.dart';
import 'package:mass/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bmi calculater"),
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexcolor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "weight",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    )),
                Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexcolor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "height",
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(.8))),
                    ))
              ],
            ),
            SizedBox(height: 30),

            GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = " You'r Over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult < 25)
                      _textResult = " You'r Noraml weight";
                    else {
                      _textResult = " You'r under weight";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Claculate",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: accentHexcolor),
                  ),
                )),

            SizedBox(height: 30),

            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexcolor),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexcolor),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(barwidth: 30),
            SizedBox(
              height: 10,
            ),
            LeftBar(barwidth: 50),
            SizedBox(
              height: 10,
            ),
            LeftBar(barwidth: 30),

            SizedBox(
              height: 10,
            ),
            RightBar(barwidth: 30),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),

            // RightBar(barwidth: 50),
            SizedBox(
              height: 10,
            ),
            RightBar(barwidth: 30),
          ],
        ),
      ),
    );
  }
}
