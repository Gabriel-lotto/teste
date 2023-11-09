import 'package:shared_preferences/shared_preferences.dart';

import 'i_shared_preference_service.dart';

const listKey = "list";

class SharedPreferenceService implements ISharedPreferenceService {
  @override
  Future<void> add(String item) async {
    final sharedPref = await SharedPreferences.getInstance();
    var list = sharedPref.getStringList(listKey) ?? [];
    list.add(item);
    await sharedPref.setStringList(listKey, list);
  }

  @override
  Future<void> delete(int index) async {
    final sharedPref = await SharedPreferences.getInstance();
    var list = sharedPref.getStringList(listKey) ?? [];
    list.removeAt(index);
    await sharedPref.setStringList(listKey, list);
  }

  @override
  Future<void> edit(String item, int index) async {
    final sharedPref = await SharedPreferences.getInstance();
    var list = sharedPref.getStringList(listKey) ?? [];
    list[index] = item;
    await sharedPref.setStringList(listKey, list);
  }

  @override
  Future<List<String>> getAll() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getStringList(listKey) ?? [];
  }
}
