import 'package:flutter/material.dart';

class ItemSuraDetails extends StatelessWidget
{
  String name;
  int index;
  ItemSuraDetails({required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return  Text(
        '$name{${index+1}}',
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
    );
  }
}