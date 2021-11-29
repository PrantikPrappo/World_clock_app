import 'package:flutter/material.dart';
import 'package:neww/services/world_time.dart';

class Location extends StatefulWidget {

  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Dhaka', location: 'Bangladesh', flag: 'bangladesh.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime (index) async {
    WorldTime inst = locations[index];
    await inst.getTime() ;
    // navigate to home screen
    Navigator.pop(context, {
      'location': inst.location,
      'flag' : inst.flag,
      'time': inst.time,
      'isDayTime' : inst.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text ('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.grey[900],
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context , index) {
          return Card (
           child: ListTile (
            onTap: () {
              updateTime(index);
            },
             title: Text(locations[index].location.toString()),
             leading: CircleAvatar(
               backgroundImage: AssetImage('assests/${locations[index].flag}'),
             ) ,

           ),
          );
        }
      ),
    );
  }
}
