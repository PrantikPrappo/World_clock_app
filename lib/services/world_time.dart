import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

 class WorldTime {

   String? location ; // loc name for ui
   String? time ; // the time in that loc
   String? flag; //
   String? url ;
   bool? isDayTime ; // is it day time or not

  WorldTime ({this.location, this.flag,this.url});

  Future <void> getTime() async {

    try { // 1st a ei code ta try kore ...

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')); // my mada foking own fixxx
      Map data = jsonDecode(response.body);
      // print (data);

      // geting property

      String datetime =data ['datetime'] ;
      String offset = data ['utc_offset'].substring(1,3); // string filter kore sub string
      // print (datetime);
      // print (offset);

      //creat date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 5.0 && now.hour < 18 ? true : false ;
      // set time property
      time = DateFormat.jm().format(now) ;
    }
    catch (e) { //kisu vul thakle prblm ta show kora jay
     print ('prblm is $e') ;
     time = ('could nt get time');
    }


   }



 }
