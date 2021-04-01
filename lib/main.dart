import 'package:businessappwithmobx/views/report_screen.dart';
import 'package:businessappwithmobx/views/transaction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: Card(
                      elevation: 8.0,
                      child: Center(child: Text('Transactions'),),
                    ),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (ctx)=>TransactionScreen())),
                  ),
                ),
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    child: Card(
                      elevation: 8.0,
                      child: Center(child: Text('Reports'),),
                      
                    ),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(ctx)=>ReportScreen())),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}