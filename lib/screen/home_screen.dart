import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_bloc/cubit/list_store_cubit/list_store_cubit.dart';
import 'package:learning_bloc/screen/list_store_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String greeting = '';
  String message = "Welcome to the Grocery Store App";

  @override
  void initState() {
    super.initState();
    updateGreeting();
  }

  void updateGreeting() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour >= 0 && hour < 12) {
      greeting = "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      greeting = "Good Afternoon";
    } else {
      greeting = "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery Store App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              greeting,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat.jm().format(DateTime.now()),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(fontSize: 18),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ListStoreScreen();
                  }));
                },
                child: Text("Click Me"))
          ],
        ),
      ),
    );
  }
}
