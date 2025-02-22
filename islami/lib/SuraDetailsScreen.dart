

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ItemSuraDetails.dart';
import 'package:islami/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';

import 'MyTheme.dart';

class SuraDetailsScreen extends StatefulWidget
{
  static const String routeName='suraDetails';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses =[];

  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppConfigProvider>(context);
    var args =ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty)
    {
      loadFile(args.index);
    }
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
             '${args.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.isEmpty ?
               Center(child: CircularProgressIndicator())
              :
          Container(
            margin: EdgeInsets.symmetric(
              vertical:MediaQuery.of(context).size.height *0.06 ,
              horizontal:MediaQuery.of(context).size.width *0.05
            ),
            decoration: BoxDecoration(
              color:   provider.isDarkMode()?
              MyTheme.primaryDarkColor:
              MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(25),
            ),

            child: ListView.separated(
              separatorBuilder: (context,index){
                return Divider(
                  color: provider.isDarkMode()?
                  MyTheme.yellowColor:
                  MyTheme.primaryLightColor,
                  thickness:2 ,
                );
              },
                itemBuilder: (context, index) {
                  return ItemSuraDetails(name: verses[index],index: index);
                },
              itemCount:verses.length ,
            ),
          ),

        )
      ],
    );

  }

  void loadFile  (int index) async {
   String content  = await  rootBundle.loadString("assets/files/${index+1}.txt");
   List<String> lines =content.split('\n');
    // for (int i =0 ; i<lines.length; i++){ print(lines[i]);}
    verses =lines;

    setState(() {

    });


  }
}

class SuraDetailsArgs
{
  String name;
  int index;
  SuraDetailsArgs({required this.name,required this.index});
}