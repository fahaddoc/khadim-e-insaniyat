extension DurationExt on Duration {
  String timeElapsed() {
    int years = inDays ~/ 365;
    if (years > 0) {
      return ('${years}yr');
    }
    int months = inDays ~/ 30;
    if (months > 0) {
      return ('${(months)}mon');
    }
    if (inDays > 0) {
      return ('${(inDays)}day');
    }
    if (inHours > 0) {
      return ('${(inHours)}hr');
    }
    if (inMinutes > 0) {
      return ('${(inMinutes)}min');
    }
    return ('${(inSeconds)}sec');
  }
}
