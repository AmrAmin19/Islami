

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ItemHadethDetails.dart';
import 'package:islami/ItemSuraDetails.dart';
import 'package:islami/hadethTab.dart';
import 'package:islami/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';

import 'MyTheme.dart';

class HadethDetailsScreen extends StatefulWidget
{
  static const String routeName='hadethDetails';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    var args =ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/dark_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        )
            :
        Image.asset('assets/images/default_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              '${args.title}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                vertical:MediaQuery.of(context).size.height *0.06 ,
                horizontal:MediaQuery.of(context).size.width *0.05
            ),
            decoration: BoxDecoration(
              color:  provider.isDarkMode()?
              MyTheme.primaryDarkColor:
              MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(25),
            ),

            child: ListView.builder(

              itemBuilder: (context, index) {
                return ItemHadethDetails(content: args.content[index]);
              },
              itemCount:args.content.length ,
            ),
          ),

        )
      ],
    );

  }

}
