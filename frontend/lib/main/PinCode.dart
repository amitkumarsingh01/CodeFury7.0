import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PincodePage extends StatefulWidget {
  @override
  _PincodePageState createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  final TextEditingController _pincodeController = TextEditingController();
  String _latitude = '';
  String _longitude = '';
  String _disasterInfo = 'No disaster data available';

  Future<void> _fetchLocation() async {
    final String pincode = _pincodeController.text;
    final String apiKey = '439a9f615fmsh05648eb2e0b2b5ap1dd71cjsn6859ad0b3550';
    final String apiHost = 'india-pincode-with-latitude-and-longitude.p.rapidapi.com';

    final response = await http.get(
      Uri.parse('https://$apiHost/api/v1/pincode/$pincode'),
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': apiHost,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          _latitude = data[0]['lat'].toString();
          _longitude = data[0]['lng'].toString();
        });
        // Fetch disaster data
        await _fetchDisasterData(double.parse(_latitude), double.parse(_longitude));
      } else {
        setState(() {
          _latitude = 'No data found';
          _longitude = 'No data found';
          _disasterInfo = 'No disaster data available';
        });
      }
    } else {
      setState(() {
        _latitude = 'Error';
        _longitude = 'Error';
        _disasterInfo = 'Error fetching data';
      });
    }
  }

  Future<void> _fetchDisasterData(double lat, double lng) async {
    final String apiKey = 'b400918a56111d12d595efd345da562f4913502e46d9694df87a6e36436f81c7';
    final String apiHost = 'api.ambeedata.com';

    final response = await http.get(
      Uri.parse('https://$apiHost/disasters/latest/by-lat-lng?lat=$lat&lng=$lng&limit=10&page=1'),
      headers: {
        'Content-type': 'application/json',
        'x-api-key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> disasters = data['disasters'] ?? [];
      if (disasters.isNotEmpty) {
        setState(() {
          _disasterInfo = disasters.map((d) => 'Type: ${d['type']}, Description: ${d['description']}').join('\n');
        });
      } else {
        setState(() {
          _disasterInfo = 'No disaster data available';
        });
      }
    } else {
      setState(() {
        _disasterInfo = 'Error fetching disaster data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pincode Risk Finder'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _pincodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Pincode',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchLocation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800], // Replaces 'primary'
              ),
              child: Text(
                'Get Location',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text('Latitude: $_latitude', style: TextStyle(color: Colors.white)),
            Text('Longitude: $_longitude', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            Text('Disaster Information:', style: TextStyle(color: Colors.white)),
            Text(_disasterInfo, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PincodePage(),
  ));
}
