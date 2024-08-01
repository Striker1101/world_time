import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    final args =  ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      data = data.isNotEmpty ? data : args;
    } else {}

    //set bg
    String bgImg = data["isDayTime"] ? "day.png" : "night.png";
    Color? bgColor = data["isDayTime"] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImg'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: ()async {
                 dynamic result =  await Navigator.pushNamed(context, "/location");
                 setState(() {
                   data = {...result};
                 });
                },
                icon: const Icon(
                  Icons.edit_location,
                  color: Colors.deepOrange,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66.0,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
