import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/contact.dart';

class ContactService {
  static const String _contactsKey = "secure_contacts_list";
  
  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  Future<List<Contact>> getContacts() async {
    final String? data = await _secureStorage.read(key: _contactsKey);
    if (data == null) return [];

    final List<dynamic> decodedList = jsonDecode(data);
    return decodedList.map((e) => Contact.fromJson(e)).toList();
  }

  Future<void> saveContacts(List<Contact> contacts) async {
    final String encodedData = jsonEncode(contacts.map((e) => e.toJson()).toList());
    await _secureStorage.write(key: _contactsKey, value: encodedData);
  }

  Future<void> addContact(Contact contact) async {
    final contacts = await getContacts();
    final exists = contacts.any((c) => c.username.toLowerCase() == contact.username.toLowerCase());
    if (exists) return;

    contacts.add(contact);
    await saveContacts(contacts);
  }

  // GLOBAL SEARCH METHOD: Instantly filters address book contacts by username or custom nickname
  Future<List<Contact>> searchContacts(String query) async {
    final allContacts = await getContacts();
    if (query.trim().isEmpty) return allContacts;

    final cleanQuery = query.trim().toLowerCase();
    return allContacts.where((c) => 
      c.username.toLowerCase().contains(cleanQuery) ||
      (c.nickname != null && c.nickname!.toLowerCase().contains(cleanQuery))
    ).toList();
  }

  Future<bool> contactExists(String username) async {
    final contacts = await getContacts();
    return contacts.any((c) => c.username.toLowerCase() == username.toLowerCase());
  }

  Future<void> clearContacts() async {
    await _secureStorage.delete(key: _contactsKey);
  }
}
