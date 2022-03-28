import 'package:flutter/material.dart';

import '../models/DateDuration.dart';
import '../utlis/DateUtil.dart';

class MyDurationCalculationPage extends StatefulWidget {
  const MyDurationCalculationPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyDurationCalculationPage> createState() => _MyDurationCalculationPageState();
}

class _MyDurationCalculationPageState extends State<MyDurationCalculationPage> {

  int _durationYears = 0, _durationMonth = 0, _durationDays = 0;

  DateTime _dateTime1 = DateTime.now().add(const Duration(days: -1));
  DateTime _dateTime2 = DateTime.now();



  void _showDatePicker1() async {
    DateTime? _newDate = await showDatePicker(
      context: context,
      initialDate: _dateTime1,
      firstDate: DateTime(0000),
      lastDate: _dateTime2.add(const Duration(days: -1)),
    );
    if(_newDate != null){
      setState(() {
        _dateTime1 = _newDate;
      });
    }
  }

  void _showDatePicker2() async {
    DateTime? _newDate = await showDatePicker(
      context: context,
      initialDate: _dateTime2,
      firstDate: _dateTime1.add(const Duration(days: 1)),
      lastDate: DateTime.now(),
    );
    if(_newDate != null){
      setState(() {
        _dateTime2 = _newDate;
      });
    }
  }

  void _calculateDuration(){
    setState(() {

      DateDuration dateDuration = DateUtil(_dateTime2).calculateDays(_dateTime1);

      _durationDays = dateDuration.days;

      _durationMonth = dateDuration.month;

      _durationYears = dateDuration.years;

    });
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
            color: const Color.fromRGBO(65, 66, 79, 1),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "Date 1 : ",
                  style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
                ),

                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),

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

                child : InkWell(
                  onTap: _showDatePicker1,
                  child: Row(
                    children: [

                      const Icon(
                          Icons.date_range,
                          color: Colors.white,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        '${_dateTime1.day}/${_dateTime1.month}/${_dateTime1.year}',
                         style: const TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
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

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Date 2 : ",
                  style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
                ),

                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),

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

                child : InkWell(
                  onTap: _showDatePicker2,
                  child: Row(
                    children: [
                      const Icon(
                          Icons.date_range,
                          color: Colors.white,
                      ),

                      const SizedBox(width: 10),

                      Text(
                        '${_dateTime2.day}/${_dateTime2.month}/${_dateTime2.year}',
                        style: const TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
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
                      style: BorderStyle.solid), //Border.all

                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ), //BorderRadius.all
                ),

              child: ElevatedButton.icon(
                onPressed: _calculateDuration,
                icon: const Icon(
                    Icons.calculate,
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
              children: <Widget>[

              const Text(
                'La différence entre les 2 dates est de : ',
                style: TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
              ),

              Text(
                /** Affichage de la différence entre les deux dates **/
                  '$_durationYears an(s), $_durationMonth mois et $_durationDays jours',
                  style: const TextStyle(fontSize: 20.0,color: Colors.white,letterSpacing: 2),
              ),
            ],
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