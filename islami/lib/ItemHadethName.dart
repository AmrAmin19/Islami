import 'package:flutter/material.dart';
import 'package:islami/HadethDetailsScreen.dart';
import 'package:islami/SuraDetailsScreen.dart';

import 'hadethTab.dart';

class ItemHadethName extends StatelessWidget
{
 // String title;
  //int index;
  Hadeth hadeth;
  ItemHadethName({required this.hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName,
          arguments: hadeth,
        );
      },
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

}