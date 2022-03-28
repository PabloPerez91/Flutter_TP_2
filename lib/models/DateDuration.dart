class DateDuration {

  int _years, _month, _days, _hours, _minutes, _seconds;

  DateDuration(this._years, this._month, this._days, this._hours, this._minutes,
      this._seconds);

  int get years => _years;

  set years(int value) {
    _years = value;
  }

  get month => _month;

  get seconds => _seconds;

  set seconds(value) {
    _seconds = value;
  }

  get minutes => _minutes;

  set minutes(value) {
    _minutes = value;
  }

  get hours => _hours;

  set hours(value) {
    _hours = value;
  }

  get days => _days;

  set days(value) {
    _days = value;
  }

  set month(value) {
    _month = value;
  }
}