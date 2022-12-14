import 'package:flutter/material.dart';
import 'package:android_library/secondpage.dart';
/*
  Green : #12a644
  Grey  : #403f3d
 */
void main() => runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor:Color(0xff294681)
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height=170.0;
  double _weight=75.0;
  int _bmi=0;
  String _condition='Select Data';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height*0.40,
              width: double.infinity,
              decoration: new BoxDecoration(color: Color(0x9F0101FF)),
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("BMI",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 60.0),),
                  Text("Calculator",style: TextStyle(color: Colors.black,fontSize: 40.0),),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child:Text("$_bmi",
                        style:TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0
                        ),textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Condition : ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_condition",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height*0.03,),
                  Text("Choose Data",style: TextStyle(color: Color(0x9F0101FF),fontSize: 30.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "Height : ",
                        style: TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height cm",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _height,
                    min:0,
                    max: 250,
                    onChanged: (height){
                      setState(() {
                        _height=height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor:Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "Weight : ",
                        style: TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight kg",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _weight,
                    min:0,
                    max: 300,
                    onChanged: (weight){
                      setState(() {
                        _weight=weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor:Color(0xFF403f3e),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.08,),
                  Container(
                    width: size.width*3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150.80),
                      child: FloatingActionButton(
                        onPressed: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder:(context)=>
                           secondpage(bmi:_bmi)));
                           //18.5 - 25 Healthy 25-30 Overweight >30 Obesity
                            _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                            if(_bmi>=18.5 && _bmi<=25) {_condition=" Normal";}
                            else if(_bmi>25 && _bmi<=30) {_condition=" Overweight";}
                            else if(_bmi>30) {_condition=" Obesity";}
                            else  {_condition=" Underweight";}
                          }
                        ,
                        child: Text("Calculate",style: TextStyle(color: Colors.black,fontSize: 10.0, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
