import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard({this.title, this.subTitle, this.color});
  final String title;
  final Widget subTitle;
  final color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: subTitle,
      ),
      color: color,
    );
  }
}
