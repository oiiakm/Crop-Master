import 'package:flutter/material.dart';
import 'predictpage.dart';
import 'dart:convert';
class Predictpage extends StatefulWidget {
  const Predictpage({ Key? key }) : super(key: key);

  @override
  _PredictpageState createState() => _PredictpageState();
}

class _PredictpageState extends State<Predictpage> {
   String url;

  var Data;

  String QueryText = 'Query';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  url = 'http://10.0.2.2:5000/api?Query=' + value.toString();
                },
                decoration: InputDecoration(
                    hintText: 'Search Anything Here',
                    suffixIcon: GestureDetector(
                        onTap: () async {
                          Data = await Getdata(url);
                          var DecodedData = jsonDecode(Data);
                          setState(() {
                            QueryText = DecodedData['Query'];
                          });
                        },
                        child: Icon(Icons.search))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                QueryText,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
      
    );
  }
}