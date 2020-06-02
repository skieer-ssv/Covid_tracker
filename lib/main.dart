import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/services/update_data.dart';
import 'models/statistics_card.dart';
import 'models/my_clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<UpdateData>(
        create: (context) => new UpdateData(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final updatedData = Provider.of<UpdateData>(context, listen: false);
    updatedData.updateData();

    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff000000), Color(0xff333333)]),
                  image: DecorationImage(
                      image: AssetImage(
                    "assets/images/virus.png",
                  ))),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  StatisticCard(
                    color: Colors.yellowAccent,
                    title: 'cases',
                    subTitle: Consumer<UpdateData>(
                      builder: (context, updatedData, child) =>
                          Text(updatedData.cases),
                    ),
                  ),
                  StatisticCard(
                    color: Colors.red,
                    title: 'active',
                    subTitle: Consumer<UpdateData>(
                      builder: (context, updatedData, child) =>
                          Text(updatedData.active),
                    ),
                  ),
                  StatisticCard(
                    color: Colors.grey,
                    title: 'deaths',
                    subTitle: Consumer<UpdateData>(
                      builder: (context, updatedData, child) =>
                          Text(updatedData.deaths),
                    ),
                  ),
                  StatisticCard(
                    color: Colors.green,
                    title: 'recovered',
                    subTitle: Consumer<UpdateData>(
                      builder: (context, updatedData, child) =>
                          Text(updatedData.recovered),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FloatingActionButton(onPressed: () => updatedData.updateData())
        ],
      ),
    );
  }
}
