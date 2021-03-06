import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {} ;
  
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print (data);

    // set bck img

    String bgImage = data ['isDayTime']  ? 'day.png' : 'night.png' ;
   // Color bgColor =  data ['isDayTime']  ? Colors.blue : Colors.indigo ;


    return Scaffold(
      appBar: AppBar (
        title: Text ('World CLock'),
        centerTitle: true,
      ),
    //  backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(
          decoration: BoxDecoration (
            image: DecorationImage (
              image: AssetImage('assests/$bgImage'),

             fit: BoxFit.cover
            )
          ),
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                   'time'        : result ['time'],
                   'location'    : result ['location'],
                   'flag'        : result ['flag'],
                   'isDayTime'   : result ['isDayTime'],
                  };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text ('Edit Loctn')
              ),
              SizedBox(
                height: 20,
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data ['location'],
                    style: TextStyle (
                      fontSize: 20,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data ['time'] ,
                style: TextStyle (
                  fontSize: 66,
                ),

              ),
            ],
          ),
        ),
      ),

    );
  }
}
