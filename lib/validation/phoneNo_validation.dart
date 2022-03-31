bool numberValidation(String value) {
  String checker = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp expression =  RegExp(checker);
  if (value.isNotEmpty) {
    return false;
  }
  else if (!expression.hasMatch(value)) {
    return false;
  }
  else
    return true;
}