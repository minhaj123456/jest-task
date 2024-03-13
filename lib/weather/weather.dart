import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class hai extends StatefulWidget {
  const hai({super.key});

  @override
  State<hai> createState() => _haiState();
}

class _haiState extends State<hai> {
  String _temperature = '';
  String _weatherCondition = '';
  String _location = '';
  bool _isLoading = true;
  TextEditingController _searchController = TextEditingController();

  Future<void> _fetchWeatherData(String location) async {
    final apiKey = '50a937a75530c33b6f9de8bdab9fb4fe';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final jsonData = json.decode(response.body);

      setState(() {
        _temperature = jsonData['main']['temp'].toString();
        _weatherCondition = jsonData['weather'][0]['main'];
        _location = jsonData['name'] + ', ' + jsonData['sys']['country'];
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching weather data: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchWeatherDataForCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=50a937a75530c33b6f9de8bdab9fb4fe&units=metric';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final jsonData = json.decode(response.body);

      setState(() {
        _temperature = jsonData['main']['temp'].toString();
        _weatherCondition = jsonData['weather'][0]['main'];
        _location = jsonData['name'] + ', ' + jsonData['sys']['country'];
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching weather data: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherDataForCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvcDKTuFJEaEuYARQBt4e1hM8WwVL4n_pBsg&usqp=CAU',
            ), 
            fit:
                BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: <Widget>[
                      Text(
                        '$_location',
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_pin, color: Colors.grey,size: 15,),
                            Text(
                              'Just updates',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Text(
                            ' $_temperature°C',
                            style: TextStyle(fontSize: 60.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        ' $_weatherCondition',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLoading = true;
                          });
                          _fetchWeatherDataForCurrentLocation();
                        },style: ElevatedButton.styleFrom(fixedSize: Size.fromWidth(140),backgroundColor: Color.fromARGB(242, 212, 233, 149)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [Icon(Icons.refresh),
                              Text('Refresh'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            labelText: 'Search Location',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            String searchLocation = _searchController.text.trim();
                            if (searchLocation.isNotEmpty) {
                              setState(() {
                                _isLoading = true;
                              });
                              _fetchWeatherData(searchLocation);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Search'),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
