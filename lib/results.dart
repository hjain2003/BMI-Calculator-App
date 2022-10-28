import 'package:flutter/material.dart';

class RESULT extends StatefulWidget {
  final String passu;
const RESULT(this.passu);

  @override
  State<RESULT> createState() => _RESULTState();
}

class _RESULTState extends State<RESULT> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("BMI Calcuator", style: TextStyle(color: Colors.white),),
    centerTitle: true,
    backgroundColor: Colors.black,
    ),
    backgroundColor: Color.fromRGBO(29, 33, 54, 100),


      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 0,vertical: 200),
        child: Column(
          children: [
            Text("Your BMI is :", style: TextStyle(color: Colors.white, fontSize: 30,fontFamily:'Trispace',fontWeight: FontWeight.bold)),

            SizedBox(height: 14),

            Text(widget.passu, style: TextStyle(color: Colors.white, fontSize: 30)),
          ],
        ),
      ),

    );
  }
}
