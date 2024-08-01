import 'package:flutter/material.dart';
import "../services/world_time.dart";

class ChoiceLocation extends StatefulWidget {
  const ChoiceLocation({super.key});

  @override
  State<ChoiceLocation> createState() => _ChoiceLocationState();
}

class _ChoiceLocationState extends State<ChoiceLocation> {
  int counter = 0;

  List<WorldTime> locations = [
    WorldTime(
        url_path: '/api/timezone/Europe/London',
        location: 'London',
        flag: 'uk.png'),
    WorldTime(
        url_path: '/api/timezone/Europe/Berlin',
        location: 'Athens',
        flag: 'greece.png'),
    WorldTime(
        url_path: '/api/timezone/Africa/Cairo',
        location: 'Cairo',
        flag: 'egypt.png'),
    WorldTime(
        url_path: '/api/timezone/Africa/Nairobi',
        location: 'Nairobi',
        flag: 'kenya.png'),
    WorldTime(
        url_path: '/api/timezone/America/Chicago',
        location: 'Chicago',
        flag: 'usa.png'),
    WorldTime(
        url_path: '/api/timezone/America/New_York',
        location: 'New York',
        flag: 'usa.png'),
    WorldTime(
        url_path: '/api/timezone/Asia/Seoul',
        location: 'Seoul',
        flag: 'south_korea.png'),
    WorldTime(
        url_path: '/api/timezone/Asia/Jakarta',
        location: 'Jakarta',
        flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    //navigate to homepage
    Navigator.pop(context, {
      'time': worldTime.time,
      'location': worldTime.location,
      'flag': worldTime.flag,
      'isDayTime': worldTime.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Choose a Location',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
