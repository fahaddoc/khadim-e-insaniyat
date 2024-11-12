String formatCurrency(String value) {
  value = value.split(',').join('');
  String newText = value.toString();
  int remainder = newText.length % 3;
  String initialText = remainder == 0
      ? newText.substring(0, 3)
      : newText.substring(0, remainder);
  String leftOverText =
      remainder == 0 ? newText.substring(3) : newText.substring(remainder);
  int index = 0;
  for (String i in leftOverText.split('')) {
    index++;
    if (index % 3 == 1) {
      initialText += ',';
    }
    initialText += i;
  }
  return initialText;
}
