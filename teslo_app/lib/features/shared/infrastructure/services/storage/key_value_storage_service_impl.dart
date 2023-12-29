import 'package:shared_preferences/shared_preferences.dart';
import '../adapter_services.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  Future<SharedPreferences> sharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await sharedPrefs();

    switch (T) {
      case int:
        return prefs.getInt(key) as T?;

      case bool:
        return prefs.getBool(key) as T?;

      case double:
        return prefs.getDouble(key) as T?;

      case String:
        return prefs.getString(key) as T?;

      case List<String>:
        return prefs.getStringList(key) as T?;

      default:
        throw UnimplementedError(
            'Get key not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await sharedPrefs();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await sharedPrefs();

    switch (T) {
      case int:
        prefs.setInt(key, value as int);
        break;
      case bool:
        prefs.setBool(key, value as bool);
        break;
      case double:
        prefs.setDouble(key, value as double);
        break;
      case String:
        prefs.setString(key, value as String);
        break;
      case List<String>:
        prefs.setStringList(key, value as List<String>);
        break;
      default:
        throw UnimplementedError(
            'Set key not implemented for type ${T.runtimeType}');
    }
  }
}
