extension FiltrableList on Iterable<String> {
  List<String> filter(String value) {
    if (value.isEmpty) {
      return toList();
    }
    List<String> newRecordList = <String>[];
    for (String item in this) {
      if (item.toLowerCase().startsWith(value.toLowerCase())) {
        newRecordList.add(item);
      }
    }
    for (String item in this) {
      if (item.toLowerCase().contains(value.toLowerCase()) && !newRecordList.contains(item)) {
        newRecordList.add(item);
      }
    }
    return newRecordList;
  }
}

extension FiltrableListObject on Iterable {
  List<T> filter<T>(String value, String Function(T) converter) {
    if (value.isEmpty) {
      return [];
    }
    List<T> newRecordList = <T>[];
    for (T item in this) {
      if (converter(item).toLowerCase().startsWith(value.toLowerCase())) {
        newRecordList.add(item);
      }
    }
    for (T item in this) {
      if (converter(item).toLowerCase().contains(value.toLowerCase()) && !newRecordList.contains(item)) {
        newRecordList.add(item);
      }
    }
    return newRecordList;
  }
}
