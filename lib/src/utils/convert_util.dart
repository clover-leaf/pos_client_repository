List<T> fromJson<T>(T Function(Map<String, dynamic>) f, dynamic json) {
  return (json as List<dynamic>)
      .map((e) => f(e as Map<String, dynamic>))
      .toList();
}
