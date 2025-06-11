import 'package:klik_app/constants/exports.dart'; // Adjust import as per your project structure

class LocalStorageService {
  // Singleton setup
  static final LocalStorageService _instance = LocalStorageService._internal();
  factory LocalStorageService() => _instance;
  LocalStorageService._internal();

  SharedPreferences? _prefs;

  /// Initialize SharedPreferences instance, call once at app start
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// ------------------ BASIC CRUD OPERATIONS --------------------

  Future<bool> setString(String key, String value) async {
    _checkPrefs();
    return _prefs!.setString(key, value);
  }

  String? getString(String key) {
    _checkPrefs();
    return _prefs!.getString(key);
  }

  Future<bool> setInt(String key, int value) async {
    _checkPrefs();
    return _prefs!.setInt(key, value);
  }

  int? getInt(String key) {
    _checkPrefs();
    return _prefs!.getInt(key);
  }

  Future<bool> setBool(String key, bool value) async {
    _checkPrefs();
    return _prefs!.setBool(key, value);
  }

  bool? getBool(String key) {
    _checkPrefs();
    return _prefs!.getBool(key);
  }

  Future<bool> setDouble(String key, double value) async {
    _checkPrefs();
    return _prefs!.setDouble(key, value);
  }

  double? getDouble(String key) {
    _checkPrefs();
    return _prefs!.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    _checkPrefs();
    return _prefs!.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    _checkPrefs();
    return _prefs!.getStringList(key);
  }

  /// ------------------ OBJECTS (JSON) --------------------

  /// Store custom object as JSON string.
  /// [toJson] is required to convert the object into Map<String, dynamic>.
  Future<bool> setObject<T>(
      String key,
      T object, {
        required Map<String, dynamic> Function(T) toJson,
      }) async {
    _checkPrefs();
    final jsonString = json.encode(toJson(object));
    return _prefs!.setString(key, jsonString);
  }

  /// Retrieve custom object by decoding JSON string and using [fromJson].
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    _checkPrefs();
    final jsonString = _prefs!.getString(key);
    if (jsonString == null) return null;
    final Map<String, dynamic> map = json.decode(jsonString);
    return fromJson(map);
  }

  /// ------------------ REMOVE & CLEAR --------------------

  Future<bool> remove(String key) async {
    _checkPrefs();
    return _prefs!.remove(key);
  }

  Future<bool> clear() async {
    _checkPrefs();
    return _prefs!.clear();
  }

  /// ------------------ SESSION MANAGEMENT --------------------

  static const _keyUserToken = 'user_token';
  static const _keyUserId = 'user_id';
  static const _keyUserLoggedIn = 'user_logged_in';

  Future<bool> setUserToken(String token) async {
    return setString(_keyUserToken, token);
  }

  String? getUserToken() {
    return getString(_keyUserToken);
  }

  Future<bool> setUserId(String userId) async {
    return setString(_keyUserId, userId);
  }

  String? getUserId() {
    return getString(_keyUserId);
  }

  Future<bool> setUserLoggedIn(bool loggedIn) async {
    return setBool(_keyUserLoggedIn, loggedIn);
  }

  bool isUserLoggedIn() {
    return getBool(_keyUserLoggedIn) ?? false;
  }

  Future<void> clearSession() async {
    await remove(_keyUserToken);
    await remove(_keyUserId);
    await remove(_keyUserLoggedIn);
  }

  /// Save user session info after successful login
  Future<void> saveUserSession(LoginModel loginModel) async {
    if (loginModel.user != null) {
      await setUserToken(loginModel.user!.token ?? '');
      await setUserId(loginModel.user!.id?.toString() ?? '');
      await setUserLoggedIn(true);
    }
  }

  /// ------------------ PRIVATE --------------------

  void _checkPrefs() {
    if (_prefs == null) {
      throw Exception('LocalStorageService not initialized. Call init() before use.');
    }
  }
}
