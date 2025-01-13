extension AppStringExtension on String {
  String toUpperFirst() {
    String firstLetter = substring(0, 1);
    return firstLetter.toUpperCase() + substring(1).toLowerCase();
  }

  String toTitleCase() {
    List<String> splittedList = split(' ');
    splittedList = splittedList.map((e) => e.toUpperFirst()).toList();
    return splittedList.join(' ');
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}".replaceAll("_", " ");
  }

  String get initials {
    if (isEmpty) {
      return this;
    }
    List<String> initials = replaceAll("  ", " ").split(' ').map((e) => e.substring(0, 1)).toList();
    if (initials.length >= 2) {
      return initials[0].toUpperCase() + initials[1].toUpperCase();
    }
    return initials[0].toUpperCase();
  }

  String get toPhoneNumberFormat {
    if (isEmpty) {
      return this;
    }
    String digits = startsWith('+1') ? substring(2) : this;
    // Remove all non-digit characters
    digits = digits.replaceAll(RegExp(r'\D'), '');
    // Check if the remaining digits are exactly 10
    if (digits.length != 10) {
      return this;
    }
    // Format the string into (XXX) XXX-XXXX
    return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
  }
}
