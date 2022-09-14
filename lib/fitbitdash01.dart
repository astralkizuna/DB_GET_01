import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:studiotestremote01/dbHelper/mongodb.dart';
import 'package:studiotestremote01/mongoReq01.dart';

class FitStat01 extends StatefulWidget {
  const FitStat01({Key? key}) : super(key: key);

  @override
  State<FitStat01> createState() => _FitStat01State();
}

class _FitStat01State extends State<FitStat01> {
  String token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzhONVMiLCJzdWIiOiI5WjdQNkYiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJycHJvIiwiZXhwIjoxNjYzNTEzODAwLCJpYXQiOjE2NjI5MDkwMDB9.Ek1WSGr3FmZtzAN36yjSLuqoYaQMBz8xiHTCW1lqVOU";
  String stats = "rly bruv";
  var statval = 0;
  Future dataReq() async {
    var headers = {
      "Authorization" : "Bearer $token"
    };

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    print('date today : $formattedDate');

    var request = http.Request('GET', Uri.parse("https://api.fitbit.com/1/user/-/profile.json"));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final String responseData = await response.stream.bytesToString();
    final data = await json.decode(responseData);

    var inti = "naah";
    if(data["user"] != null){
      print("record found");
      inti = data["user"]["firstName"];
      print(inti);
    }else{
      print("data record null");
    }


    if (response.statusCode == 200) {
      print('responseData success');
      statval = response.statusCode;
    }
    else {
      statval = response.statusCode;
      stats = "not ok";
      print(response.reasonPhrase);
    }
    print(statval);
    return responseData;
  }
  var newtok = "nulls";
  var newtoks = MongoDatabase.connect();// jd

  void initState(){
    dataReq();
    print("check val here");
    MongoDatabase.connect();
    print(newtoks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          SizedBox(width:50),
          Column(
            children: const [
              SizedBox(height: 300),
              Text(
                'Connection :',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'Status rep :',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(

            children: [
              SizedBox(height: 300),
              Text(
                newtok,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                statval.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
