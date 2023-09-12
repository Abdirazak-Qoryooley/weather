import 'package:flutter/material.dart';
import 'package:new_weather/search.dart';

void main() {
  runApp(MaterialApp(
    home: scr1(),
  ));
}

class scr1 extends StatelessWidget {
  const scr1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/home1.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                'Weather App',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => scr2()));
          },
          label: Text('Search')),
    );
  }
}
