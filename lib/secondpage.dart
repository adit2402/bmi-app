import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class secondpage extends StatefulWidget {
  secondpage({required this.bmi});

  int bmi;
  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    var width;
    return Scaffold(
    appBar: AppBar(
        title: Text("Result"),
      ),
        body: Column(
              children: [
                GestureDetector(
                    onTap: (){
                    Navigator.pop(context);
                    },
                    child:Container(
                    child: Text("Recalculate",
                        style: TextStyle(color: Colors.black,fontSize: 30.0, fontWeight: FontWeight.normal
                        )),
                    )
                ),
                Text("",style: TextStyle(color: Colors.black,fontSize: 30.0, fontWeight: FontWeight.bold),),
                Text("         Your BMI is :  ${widget.bmi}",
                    style: TextStyle(color: Colors.black,fontSize: 30.0, fontWeight: FontWeight.bold)),
                Text("    Please Rate this App : ",
                    style: TextStyle(color: Colors.black,fontSize: 30.0, fontWeight: FontWeight.bold)
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 0.5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ]
      )
    );
  }
}
