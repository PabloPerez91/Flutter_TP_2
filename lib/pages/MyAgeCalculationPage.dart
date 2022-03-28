import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tp2/models/DateDuration.dart';
import 'package:tp2/utlis/DateUtil.dart';

class MyAgeCalculationPage extends StatefulWidget {
  const MyAgeCalculationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAgeCalculationPage> createState() => _MyAgeCalculationPageState();
}

class _MyAgeCalculationPageState extends State<MyAgeCalculationPage> {

  DateTime _dateTime = DateTime.now();
  int _ageYears = 0, _ageMonth = 0, _ageDays = 0, _ageHours = 0, _ageMinutes = 0, _ageSeconds = 0;
  bool isAgeVisible = false;
  Timer timer = Timer(const Duration(), () {});



  void _showDatePicker() async {
    DateTime? _newDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(DateTime.now().year - 123),
      lastDate: DateTime.now(),
    );
    if(_newDate != null){
      setState(() {
        _dateTime = _newDate;
      });
    }
  }

  void _calculateAge(){
    setState(() {

      DateDuration dateDuration = DateUtil(DateTime.now()).calculateSeconds(_dateTime);

      _ageSeconds = dateDuration.seconds;
      _ageMinutes = dateDuration.minutes;
      _ageHours = dateDuration.hours;
      _ageDays = dateDuration.days;
      _ageMonth = dateDuration.month;
      _ageYears = dateDuration.years;

    });
    if(timer.isActive) {
      timer.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => _calculateAge());
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(

        margin: const EdgeInsets.all(25.0),
        padding: const EdgeInsets.all(25.0),

        decoration: BoxDecoration(
          color: Colors.grey,

        border: Border.all(
          color: Color.fromRGBO(65, 66, 79, 1),
          width: 4.0,
          style: BorderStyle.solid),
          //Border.all
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ), //BorderRadius.all
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Spacer(flex: 5,),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "Date de naissance : ",
                  style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
                ),

                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),

                  decoration: BoxDecoration(
                    color: Colors.blue,

                    border: Border.all(
                        color: Color.fromRGBO(65, 66, 79, 1),
                        width: 4.0,
                        style: BorderStyle.solid),
                    //Border.all
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ), //BorderRadius.all
                  ),

                child : InkWell(
                  onTap: _showDatePicker,
                  child: Row(
                    children: [

                      const Icon(
                          Icons.date_range,
                          color: Colors.white,
                          size: 30,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
                         style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
                      ),

                      const SizedBox(width: 15),

                      const Icon(
                        Icons.arrow_circle_left_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                ),
              ],
            ),

            const Spacer(flex: 2,),

            Center(
              child: Container(
                width: 170,
                height: 50,

                decoration: BoxDecoration(
                  color: Colors.blue,

                  border: Border.all(
                      color: const Color.fromRGBO(65, 66, 79, 1),
                      width: 4.0,
                      style: BorderStyle.solid),
                  //Border.all
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ), //BorderRadius.all
                ),

              child: ElevatedButton.icon(
                onPressed: _calculateAge,
                icon: const Icon(
                    Icons.calculate,
                    size: 30,
                ),

                label: const Text(
                    "Calcul",
                    style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
                ),
              ),
            ),
            ),

            const Spacer(flex: 2,),

            Center(
              child: Text(
                  'Tu as $_ageYears ans',
                   style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
              ),
            ),

            const Spacer(flex: 2,),

            Center(
              child: Text(
                'Ton âge exact : $_ageYears ans, $_ageMonth mois, $_ageDays jours, $_ageHours heure(s) $_ageMinutes minute(s) et $_ageSeconds second(s)',
                 style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
              ),
            ),

            const Spacer(flex: 8,),

          ],
        ),
        ),
      ),
    );
  }
}