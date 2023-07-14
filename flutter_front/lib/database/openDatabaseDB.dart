import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), '.db');

  return openDatabase(
    path, 
    onCreate: (db, version) {

    }, version: 1);
}
