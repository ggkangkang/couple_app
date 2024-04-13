
class DateCounter{
  static int day(DateTime firstDayDate){
    final DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(firstDayDate);
    return difference.inDays;
  }
}