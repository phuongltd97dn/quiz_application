int toInt(value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  int? result;
  if (value is num) {
    result = value.toInt();
  } else if (value is String && value.isNotEmpty) {
    result = int.tryParse(value);
  } else if (value is bool) {
    result = value ? 1 : 0;
  }
  return result ?? defaultValue;
}
