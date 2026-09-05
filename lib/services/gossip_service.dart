import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class GossipService {
  static const String _blacklistKey = "destruction_blacklist";

  // Task 1: Fetch our local blacklist registry to prepare a transmission packet string
  static Future<String> prepareExportPacket() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> myLocalBlacklist = prefs.getStringList(_blacklistKey) ?? [];
    return jsonEncode(myLocalBlacklist);
  }

  // Task 2: Receive a payload list string from a peer, merge it, and execute a cascading memory wipe
  static Future<void> importAndSyncMesh(String rawPeerJsonPayload) async {
    if (rawPeerJsonPayload.isEmpty) return;

    try {
      final List<dynamic> decodedList = jsonDecode(rawPeerJsonPayload);
      final List<String> incomingPeerBlacklist = decodedList.map((e) => e.toString().toLowerCase()).toList();

      final prefs = await SharedPreferences.getInstance();
      final List<String> myLocalBlacklist = prefs.getStringList(_blacklistKey) ?? [];
      
      bool databaseUpdated = false;

      // Check and absorb any newly discovered blacklisted User IDs
      for (String blockedId in incomingPeerBlacklist) {
        if (!myLocalBlacklist.contains(blockedId)) {
          myLocalBlacklist.add(blockedId);
          databaseUpdated = true;
        }
      }

      // If we learned new blocked IDs, save them and immediately purge them from all chat records
      if (databaseUpdated) {
        await prefs.setStringList(_blacklistKey, myLocalBlacklist);
        await executeCascadeSelfDestruct(); // Run the local memory purge query instantly
      }
    } catch (e) {
      print("Mesh synchronize failure: $e");
    }
  }

  // Task 3: The actual storage cleaner loop that scans database keys and drops blocked messages from disk files
  static Future<void> executeCascadeSelfDestruct() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> blacklist = prefs.getStringList(_blacklistKey) ?? [];
    if (blacklist.isEmpty) return;

    final Set<String> allKeys = prefs.getKeys();
    // Isolate SharedPreferences storage slots allocated to active text chat history blocks
    final List<String> messageStorageKeys = allKeys.where((k) => k.startsWith("messages_")).toList();

    for (String key in messageStorageKeys) {
      final List<String> dataList = prefs.getStringList(key) ?? [];
      if (dataList.isEmpty) continue;

      final int originalCount = dataList.length;

      // Dropping message chunks cleanly from text streams matching blacklisted users [INDEX]
      dataList.removeWhere((item) {
        final String lowercaseItem = item.toLowerCase();
        // Checks if the json string row parameters contain the blocked UID identifier
        return blacklist.any((blockedUser) => lowercaseItem.contains('"sender":"$blockedUser"'));
      });

      // Commit changes back to hard hardware slots or drop the map entry entirely if empty
      if (dataList.length != originalCount) {
        if (dataList.isEmpty) {
          await prefs.remove(key);
        } else {
          await prefs.setStringList(key, dataList);
        }
      }
    }
  }
}
