import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static late SharedPreferences _prefs;
  static Future <void>  init() async{
    _prefs = await SharedPreferences.getInstance();
  }
  static  setIsFirstTime()async{
    await _prefs.setBool("isFirstTime", true);
  }
  static setIsNotFirstTime()async{
    await _prefs.setBool("isnotFirstTime", false);
  }
  static bool get isFirstTime {
    return _prefs.getBool("isFirstTime")??true;
  }
  static bool get isNotFirstTime {
    return _prefs.getBool("isnotFirstTime")??false;
  }
  static String getRemovepassword() {
    return _prefs.remove("savedpasswoed").toString();
  }
  static String getRemove() {
    return _prefs.remove("saveemail").toString();
  }
  static setSaveEmail(String value)async{
    await _prefs.setString("saveemail", value);
  }
  static String get saveEmail {
    String email= _prefs.getString("saveemail")??"";
    print(email);
    return _prefs.getString("saveemail")??"";
  }
  static setPassword(String value)async{
    await _prefs.setString("savedpasswoed", value);
  }
  static String get savesetPassword {
    String email= _prefs.getString("savedpasswoed")??"";
    print(email);
    return _prefs.getString("savedpasswoed")??"";
  }
  static setUserName(String value)async{
    await _prefs.setString("name", value);
  }
  static String get userName {
    String name= _prefs.getString("name")??"";
    print(name);
    return _prefs.getString("name")??"";
  }
  static setUserToken(String value)async{
    await _prefs.setString("token", value);
  }
  static String get token {
    String token= _prefs.getString("token")??"";
    print(token);
    return _prefs.getString("token")??"";
  }
  static setUserEmail(String value)async{
    await _prefs.setString("email", value);
  }
  static String get email {
    String email= _prefs.getString("email")??"";
    print(email);
    return _prefs.getString("email")??"";
  }
  static setUserCreatedAt(String value)async{
    await _prefs.setString("created_at", value);
  }
  static String get createdAt {
    String create= _prefs.getString("created_at")??"";
    print(create);
    return _prefs.getString("created_at")??"";
  }
  static setUserUpdatedAt(String value)async{
    await _prefs.setString("updated_at", value);
  }
  static String get updatedAt {
    String update= _prefs.getString("updated_at")??"";
    print(update);
    return _prefs.getString("updated_at")??"";
  }
  static setUserId(int value)async{
    await _prefs.setInt("id", value);
  }
  static int get id {
    int id= _prefs.getInt("id")??0;
    print(id);
    return _prefs.getInt("id")??0;
  }

  // static String get token{
  //  return _prefs.getString("token")??"434|Dfm65OUDf601rNKg2wDW3MIyfH7VNIiizKJJslWA";
  // }

  }