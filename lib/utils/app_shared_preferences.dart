import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void holdEmojiClicked(String emoji) async {
    final SharedPreferences prefs = await _prefs;
    var temp = prefs.getStringList("emojisClicked") ?? [];
    bool exist = false;

    for (var element in temp)
      if (element == emoji) {
        exist = true;
        break;
      }

    if (exist)

      /// update position of emoji exist
      temp.insert(0, temp.removeAt(temp.indexOf(emoji)));
    else {
      if (temp.length < 23)
        temp.insert(0, emoji);
      else {
        temp.removeAt(22);
        temp.insert(0, emoji);
      }
    }
    await prefs.setStringList("emojisClicked", temp);
  }

  Future<List<String>> getRecentlyEmojisClicked() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList("emojisClicked") ?? [];
  }
}
