import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date ',
      home: MyHomePage(title: 'Date',),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  DateTime selectedData = DateTime.now();
  Future <Null> _selectData(BuildContext context) async {

  final DateTime? picked = await showDatePicker(
    context: context, 
    initialDate: selectedData, 
    firstDate: DateTime(1950,8), 
    lastDate: DateTime(2100));

  if (picked != null && picked != selectedData)
  setState(() {
    selectedData = picked;
  });
}

  @override
  Widget build(BuildContext context) {

    String resultDate = DateFormat('dd-MM-yyyy').format(selectedData);
    return Scaffold(
      appBar: AppBar(  
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(resultDate), 

            SizedBox(height: 20.0,),

            ElevatedButton(onPressed: (() =>  _selectData(context) ),
         
            child:  Text('Select Date'),
          
          ),
        ],
        ),

      ),
    );
  }
}
