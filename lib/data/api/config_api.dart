class ConfigApi {
  Future<Map<String, String>> get headers async =>
      {'Content-Type': 'application/json'};

  static final Map<String, String> headersWithoutToken = {
    'Content-Type': 'application/json'
  };
}
