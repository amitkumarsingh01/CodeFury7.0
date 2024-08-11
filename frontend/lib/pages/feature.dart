import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Feature extends StatefulWidget {
  @override
  _FeatureState createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  List<dynamic> disasterData = [];

  @override
  void initState() {
    super.initState();
    fetchDisasterData();
  }

  Future<void> fetchDisasterData() async {
    final response = await http.get(Uri.parse(
        'https://api.reliefweb.int/v1/disasters?appname=eagle&profile=list&preset=latest&slim=1'));

    if (response.statusCode == 200) {
      setState(() {
        disasterData = json.decode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disaster Management'),
        backgroundColor: Colors.black,
      ),
      body: disasterData.isEmpty
          ? Center(child: CircularProgressIndicator(color: Colors.black))
          : ListView.builder(
        itemCount: disasterData.length,
        itemBuilder: (context, index) {
          final disaster = disasterData[index]['fields'];
          final country = disaster['country'][0]['name'];
          final type = disaster['type'][0]['name'];
          final date = disaster['date']['created'];
          final status = disaster['status'];
          final url = disaster['url'];

          return Card(
            color: Colors.black,
            child: ListTile(
              title: Text(
                disaster['name'],
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('Country: $country',
                      style: TextStyle(color: Colors.grey)),
                  Text('Type: $type',
                      style: TextStyle(color: Colors.grey)),
                  Text('Status: $status',
                      style: TextStyle(color: Colors.grey)),
                  Text('Date: $date',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                _launchURL(url);
              },
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() => runApp(MaterialApp(
  home: Feature(),
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      accentColor: Colors.white, // Defines the accent color
    ).copyWith(
      secondary: Colors.white, // Also set secondary color to white
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.black, // Set AppBar background to black
    ),
  ),
));
