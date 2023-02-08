import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = const FlutterSecureStorage();

void writeJWT(String token) {
  print("writing token to storage");
  storage.write(key: 'jwt', value: token);
}

Future<String> readJWT() {
  String token = storage.read(key: 'jwt') as String;
  return Future.value(token);
}
