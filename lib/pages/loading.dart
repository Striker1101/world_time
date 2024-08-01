import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import "../services/world_time.dart";

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setWorldTime() async {
    WorldTime worldTime = WorldTime(
        flag: 'london.png',
        location: 'london',
        url_path: "/api/timezone/Europe/London");

    await worldTime.getTime();

    Navigator.pushReplacementNamed (context, '/home', arguments: {
       'time': worldTime.time,
      'location': worldTime.location,
      'flag': worldTime.flag,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
         child: SpinKitRotatingCircle(
           color: Colors.white,
           size: 80.0,
         ),
      )
    );
  }
}
