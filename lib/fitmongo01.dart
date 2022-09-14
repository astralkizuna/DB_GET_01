import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studiotestremote01/dbHelper/mongodb.dart';

class FitDBlink01 extends StatefulWidget {
  const FitDBlink01({Key? key}) : super(key: key);

  @override
  State<FitDBlink01> createState() => _FitDBlink01State();
}

class _FitDBlink01State extends State<FitDBlink01> {

  Future dataReq() async
  {
    var token;
    token = await MongoDatabase.connect();
    print("token status : $token");



    //##########################################################################################
    //                                   fitbit API init.
    //##########################################################################################
    var headers = {
      "Authorization" : "Bearer $token"
    };//auth params utk fitbit API

    var request = http.Request('GET', Uri.parse("https://api.fitbit.com/1/user/-/profile.json"));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final String responseData = await response.stream.bytesToString();
    final data = await json.decode(responseData);

    //cari entry dlm json
    var inti = "naah";
    if(data["user"] != null){
      inti = data["user"]["firstName"];
    }else{
      print("data record null");
    }
    print("record found : $inti");

    if (response.statusCode == 200) {
      print('responseData success');
    }
    else {
      print(response.reasonPhrase);
    }
    return responseData;
  }

  void initState(){
    dataReq();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
