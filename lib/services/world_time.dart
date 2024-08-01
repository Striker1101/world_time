import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the UI
  late String time; //time in that location
  late String flag; //url to an assest flag icon
  late String url_path; //url of the  weather api
  late bool isDayTime; //indicate if we have a day or night
  WorldTime(
      {required this.flag, required this.location, required this.url_path});
//

  Future<void> getTime() async {
    //set url property
    // "/api/timezone/Europe/London";
    // Future.delayed(Duration(seconds: 3), () {});
    try {
      var url = Uri.https('worldtimeapi.org', url_path);

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        //get the data
        String datetime = jsonResponse['datetime'];
        String offset = jsonResponse['utc_offset'].substring(1, 3);

        //get time
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        //set time property using intl
        isDayTime = now.hour > 6 && now.hour  < 20 ? true: false;

        time = DateFormat.jm().format(now);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      time = "time could not be retrived";
    }
  }
}
