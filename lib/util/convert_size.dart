double convertWidth(double width, int divisor) {
  var result = width / divisor;
  result = width / double.parse(result.toStringAsFixed(2));
  return double.parse(result.toStringAsFixed(0));
}

double convertHeight(double height, int divisor) {
  var result = height / divisor;
  result = height / double.parse(result.toStringAsFixed(2));

  return double.parse(result.toStringAsFixed(0));
}

double margin(double height, int top) {
  var margin = height / top;
  margin = height / double.parse(margin.toStringAsFixed(2));
  return double.parse(margin.toStringAsFixed(0));
}
