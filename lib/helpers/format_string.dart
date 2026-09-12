String truncateString(String str, {int maxLength = 10}) {
  if (str.length > maxLength) {
    return '${str.substring(0, maxLength - 3)}...';
  }
  return str;
}
