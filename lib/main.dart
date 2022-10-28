import 'package:flutter/material.dart';
import 'package:harshjain_102103432/results.dart';

void main()=>runApp(MaterialApp(
  home: Info(),
));

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {

  double value=50;
  late String passu;

  final heightc=TextEditingController();
  final weightc=TextEditingController();

  late double _bmi;

  void calculateBMI(double height,double weight)
  {
    double bmi=weight/(height * height);
    _bmi=bmi;
    passu=_bmi.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calcuator", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromRGBO(29, 33, 54, 100),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black,
              alignment: Alignment.center,
              width: 500,
              child: Text("HARSH JAIN(102103432)",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  height: 160,width: 160,
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(50, 50, 68, 100),
                  ),
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(50, 50, 68, 100)
                    ),
                    onPressed: (){},
                    child: Icon(
                      Icons.male,color: Colors.white,size: 140
                    ),
                    ),
                  ),

                Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  height: 160,width: 160,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(50, 50, 68, 100),
                  ),
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(50, 50, 68, 100)
                    ),
                    onPressed: (){},
                    child: Icon(
                        Icons.female,color: Colors.white,size: 140
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height:20),

            Container(
              margin: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(50, 50, 68, 100),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Age", style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'Anek')),

                  SizedBox(height: 20),

                  Container(
                    child:Slider(
                      value: value,
                      min: 10,
                      max: 100,
                      divisions: 90,
                      onChanged: (value) => setState(()=>this.value=value),
                      activeColor: Colors.blue,
                      label: value.round().toString(),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  height: 160,width: 160,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(50, 50, 68, 100),
                  ),
                  child: Column(
                    children: [
                      Text("Height", style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Anek'),),
                      Text("(m)", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: 'Anek'),),
                      SizedBox(height: 20),
                      TextField(
                        controller:heightc,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 160,width: 160,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(50, 50, 68, 100),
                  ),
                  child: Column(
                    children: [
                      Text("Weight", style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Anek'),),
                      Text("(kg)", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: 'Anek'),),
                      SizedBox(height: 20),
                      TextField(
                        controller:weightc,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

              SizedBox(height:40),

              Container(
                padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                child: ElevatedButton(
                    onPressed: (){
                      double height=double.parse(heightc.text);
                      double weight=double.parse(weightc.text);
                      calculateBMI(height,weight);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RESULT(passu)));
                    },
                    child: Text("CALCULATE"),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            ),
                        ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                    ),
                ),
              ),
          ],
        ),
      ),

    );
  }
}
