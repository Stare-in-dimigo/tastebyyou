import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

Future<DataSnapshot> getSnapshot(String child) async {
  return await database.ref().child(child).get();
}

Future<DatabaseReference> getReference(String child) async {
  return await database.ref().child(child);
}
