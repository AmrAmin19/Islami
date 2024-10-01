import 'package:flutter/material.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/Settings/settingsTab.dart';
import 'package:islami/hadethTab.dart';
import 'package:islami/providers/appConfigProvider.dart';
import 'package:islami/quranTab.dart';
import 'package:islami/radioTab.dart';
import 'package:islami/sebhaTab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget
{
  static const String routeName='Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex=index;
              setState(() {

              });
            } ,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_quran.png')
                  ) ,
                  label: AppLocalizations.of(context)!.quran
              ),

              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icon_hadeth.png')
                  ) ,
                  label: AppLocalizations.of(context)!.hadeth
              ),

              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icon_sebha.png')
                  ) ,
                  label: AppLocalizations.of(context)!.sebha
              ),

              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage('assets/images/icon_radio.png')
                  ) ,
                  label: AppLocalizations.of(context)!.radio
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.settings) ,
                  label: AppLocalizations.of(context)!.settings
              ),

            ],
          ),
        ),
          body: tabs[selectedIndex],
        )
      ],
    );


  }
   List<Widget> tabs=[
     QuranTab(),HadethTab(),SebhaTab(),RadioTab(),SettingsTab()
   ];
}