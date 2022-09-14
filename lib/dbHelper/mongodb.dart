import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:studiotestremote01/fitbitdash02.dart';
import 'constant.dart';

class MongoDatabase{
  static var db, userCollection;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("MongoDB Connected");
    }
    userCollection = db.collection(USER_COLLECTION);
    var umur = await userCollection.find({"age": 23}).toList();
    var data = umur[0]["token"];
    return data;
  }
}