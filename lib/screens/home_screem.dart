import 'package:bmi/constants/app_constant.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _result = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHex, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHex,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHex),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Height",
                    hintStyle: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: _weightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHex),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Weight",
                    hintStyle: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: mainHex.withOpacity(0.6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
            ),
            onPressed: () {
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              setState(() {
                _result = _w / (_h * _h);
                if (_result > 25) {
                  _textResult = "You're over weight";
                } else if (_result >= 18.5 && _result <= 25) {
                  _textResult = "You're normal";
                } else {
                  _textResult = "You're under weight";
                }
              });
            },
            child: Text(
              'Calculate',
              style: TextStyle(fontSize: 23, color: accentHex),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            child: Text(
              _result.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: accentHex),
            ),
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Text(
              _textResult,
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.w400, color: accentHex),
            ),
          ),
          const SizedBox(height: 25),
          LeftBar(barWidth: 50),
          const SizedBox(height: 25),
          LeftBar(barWidth: 70),
          const SizedBox(height: 25),
          RightBar(barWidth: 80),
          const SizedBox(height: 25),
          RightBar(barWidth: 60)
        ]),
      ),
    );
  }
}
