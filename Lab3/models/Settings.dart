class Settings {
  // Store singleton instance
  static final Settings _instance = Settings._internal();

  // Private constructor
  Settings._internal();

  // Factory constructor returns the same instance
  factory Settings() {
    return _instance;
  }

  String theme = 'Dark';
}