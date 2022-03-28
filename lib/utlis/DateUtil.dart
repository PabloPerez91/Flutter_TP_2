import 'package:flutter/material.dart';

import '../models/DateDuration.dart';

class DateUtil {

  DateDuration _dateDuration = DateDuration(0, 0, 0, 0, 0, 0);

  DateTime dateTime1;

  DateUtil(this.dateTime1);

  DateDuration calculateYears(DateTime dateTime2){
    _dateDuration.years += dateTime1.year - dateTime2.year;
    if ( _dateDuration.years < 0 ){
      _dateDuration.years = 0;
    }
    return _dateDuration;
  }

  DateDuration calculateMonth(DateTime dateTime2){
    _dateDuration.month += dateTime1.month - dateTime2.month;
    if( _dateDuration.month < 0 ){
      _dateDuration.years --;
      _dateDuration.month += 12;
    }
    calculateYears(dateTime2);
    return _dateDuration;
  }

  DateDuration calculateDays(DateTime dateTime2){
    _dateDuration.days += dateTime1.day - dateTime2.day;
    if( _dateDuration.days < 0 ){
      _dateDuration.month --;
      DateTime birthDayMonth = DateTime(dateTime2.year,dateTime2.month,0).toUtc();
      int numbDay = DateTime(dateTime2.year,dateTime2.month + 1,0).toUtc().difference(birthDayMonth).inDays;
      _dateDuration.days += numbDay;
    }
    calculateMonth(dateTime2);
    return _dateDuration;
  }

  DateDuration calculateHours(DateTime dateTime2){
    _dateDuration.hours += dateTime1.hour - dateTime2.hour;
    if( _dateDuration.hours < 0 ){
      _dateDuration.days --;
      _dateDuration.hours += 24;
    }
    calculateDays(dateTime2);
    return _dateDuration;
  }

  DateDuration calculateMinutes(DateTime dateTime2){
    _dateDuration.minutes += dateTime1.minute - dateTime2.minute;
    if( _dateDuration.minutes < 0 ){
      _dateDuration.hours --;
      _dateDuration.minutes += 60;
    }
    calculateHours(dateTime2);
    return _dateDuration;
  }

  DateDuration calculateSeconds(DateTime dateTime2){
    _dateDuration.seconds += dateTime1.second - dateTime2.second;
    if( _dateDuration.seconds < 0 ) {
      _dateDuration.minutes --;
      _dateDuration.seconds += 60;
    }
    calculateMinutes(dateTime2);
    return _dateDuration;
  }


}