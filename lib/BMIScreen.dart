import 'package:arogyatracker/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'BMIModel.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double _heightOfUser = 50.0;
  double _weightOfUser = 20.0;

  double _bmi = 0;

  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  child: SvgPicture.asset("assets/heart.svg", fit: BoxFit.contain,),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("BMI Calculator", style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
                SizedBox(
                  height: 10,
                ),
                Text("We care about your health", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
                SizedBox(
                  height: 35,
                ),

                Text("Height (cm)", style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),

                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Slider(
                    min: 0.0,
                    max: 200.0,
                    onChanged: (height){
                      setState(() {
                        _heightOfUser = height;
                      });
                    },
                    value: _heightOfUser,
                    divisions: 100,
                    activeColor: Colors.pink,
                    label: "$_heightOfUser",
                  ),
                ),

                Text("$_heightOfUser cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

                SizedBox(height: 30,),

                Text("Weight (kg)", style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),

                Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Slider(
                    min: 0.0,
                    max: 200.0,
                    onChanged: (height){
                      setState(() {
                        _weightOfUser = height;
                      });
                    },
                    value: _weightOfUser,
                    divisions: 100,
                    activeColor: Colors.pink,
                    label: "$_weightOfUser",
                  ),
                ),

                Text("$_weightOfUser kg", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

                SizedBox(height: 20,),

                Container(
                  child: FlatButton.icon(
                    onPressed: (){
                      setState(() {
                        _bmi = _weightOfUser/((_heightOfUser/100)*(_heightOfUser/100));

                        if(_bmi >= 18.5 && _bmi <= 25){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: true, comments: "You are Totally Fit");
                        }else if(_bmi < 18.5){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are Under-weighted");
                        }else if(_bmi > 25 && _bmi <= 30){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are Over-weighted");
                        }else{
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You are obese");
                        }
                      });

                      Navigator.push(context, MaterialPageRoute(
                         builder: (context) => ResultScreen(bmiModel: _bmiModel,)
                      ));
                    },
                    icon: Icon(Icons.favorite, color: Colors.white,),
                    label: Text("CALCULATE"),
                    textColor: Colors.white,
                    color: Colors.pink,

                  ),
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16, right: 16),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}