import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  var location;
  var time;
  var flag;
  var url;
  var isDayTime;

  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime.substring(0,26));
      isDayTime = now.hour>5 &&now.hour<18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print(e);
      time = 'could not get the time';
    }
  }
}


