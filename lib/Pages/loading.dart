import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neww/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   // String time = 'loading' ;

  void setupWordTime () async {
    WorldTime inst = WorldTime(location: 'Dhaka', flag: 'bd.png',url: 'Asia/Dhaka'  );
    await inst.getTime();
    Navigator.pushReplacementNamed(context,'/home', arguments: {
      'location': inst.location,
      'flag' : inst.flag,
      'time': inst.time,
      'isDayTime' : inst.isDayTime,
    } );
  }

  @override
  void initState() {
    super.initState();
    setupWordTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column (
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: SpinKitSpinningLines(
              color: Colors.blue,
              size: 170.0,
            ),
          ),
          // SizedBox(
          //   height: 150,
          // ),
          Column(
            children: [
              SizedBox(
                height: 290,
              ),
              Text('Made By Prantik Prappo',
              style: TextStyle (
                backgroundColor: Colors.indigo,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
