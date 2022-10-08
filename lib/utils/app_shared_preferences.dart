import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void holdEmojiClicked(String emoji) async {
    final SharedPreferences prefs = await _prefs;
    var temp = prefs.getStringList("emojisClicked") ?? [];
    bool add = true;

    for (var element in temp)
      if (element == emoji) {
        add = false;
        break;
      }

    if (add) {
      if (temp.length < 23)
        temp.insert(0, emoji);
      else {
        temp.removeAt(22);
        temp.insert(0, emoji);
      }
      await prefs.setStringList("emojisClicked", temp);
    }
  }

  Future<List<String>> getRecentlyEmojisClicked() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList("emojisClicked") ?? [];
  }
}
