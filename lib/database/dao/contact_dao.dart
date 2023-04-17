import 'package:api/database/app_database.dart';
import 'package:api/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY,'
      'name TEXT,'
      'account_number INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert("contacts", contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query("contacts");
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];

    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row["id"],
        row["name"],
        row["account_number"],
      );

      contacts.add(contact);
    }

    return contacts;
  }
}
