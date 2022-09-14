import 'package:mongo_dart/mongo_dart.dart';
import 'dart:io' show Platform;

String host = Platform.environment['MONGO_DART_DRIVER_HOST'] ?? '127.0.0.1';
String port = Platform.environment['MONGO_DART_DRIVER_PORT'] ?? '27017';

void DBmain() async{
  var db = Db("mongodb+srv://public01:pspspsps@cluster01.ad0sso9.mongodb.net/?retryWrites=true&w=majority");
  await db.open();
}