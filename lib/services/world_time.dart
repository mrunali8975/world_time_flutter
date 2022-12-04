import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime
{
  String location; //location in api
  String time=''; // time in that location
  String flag ;// url to an asset flag icon
  String url;
  bool isDayTime=false; //true or false if day time or not

//constructor
WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    // String url='https://jsonplaceholder.typicode.com/todos/1'; https://worldtimeapi.org/api/timezone/Europe/London
    try
    {
      var myurl =
      Uri.https( 'www.worldtimeapi.org', '/api/timezone/$url', {'q': '{http}'});
      var res = await http.get(myurl);
      // print(res.body);
      Map data=jsonDecode(res.body);
      // print(data);
      // get properties from data
      String dateTime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
      // print(dateTime);
      // print(offset);
      //  create DateTime object
      DateTime now=DateTime.parse(dateTime);
      now =now.add(Duration(hours:int.parse(offset) ));
      //set time property
      isDayTime= now.hour>6 && now.hour<20?true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e)
    {
      print('error $e');
      time='$e';
    }

  }
}
