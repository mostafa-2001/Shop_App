import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {

  static late SharedPreferences sharedPreferences;

  static initi() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  static Future<bool> Putboolean({required String key , required bool value})async
  {
    return await  sharedPreferences.setBool(key, value);
  }
  static dynamic Getdata({required String key })
  {
    return sharedPreferences.get(key);
  }

  static Future<bool> savedata({required dynamic value, required String key})async
  {
      if(value is String) return await sharedPreferences.setString(key,value);
      if(value is int) return await sharedPreferences.setInt(key,value);
      if(value is bool) return await sharedPreferences.setBool(key, value);
       return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool > removegata({ required String key})async
  {
     return await sharedPreferences.remove(key);
  }
}