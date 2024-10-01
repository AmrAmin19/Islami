import 'package:flutter/material.dart';
import 'package:islami/MyTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Settings/languageButtomSheet.dart';
import 'package:islami/Settings/themeButtomSheet.dart';
import 'package:islami/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget
{
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(AppLocalizations.of(context)!.language,
         style: Theme.of(context).textTheme.titleMedium,
         ),

         SizedBox(height: 10),

         InkWell(
           onTap: ()
           {
             showLanguageButtomSheet();
           },
           child: Container(
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               color: MyTheme.primaryLightColor,
               borderRadius: BorderRadius.circular(20)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(provider.appLanguage=='en'?
                 AppLocalizations.of(context)!.english
                     :
                 AppLocalizations.of(context)!.arabic
                     ,
                     style: Theme.of(context).textTheme.titleSmall
                 ),
                 Icon(Icons.arrow_drop_down,size: 30)
               ],
             ),
           ),
         ),

         SizedBox(height: 20),

         Text(AppLocalizations.of(context)!.theme,
           style: Theme.of(context).textTheme.titleMedium,
         ),

         SizedBox(height: 10),

         InkWell(
           onTap: ()
           {
             showThemeButtomSheet();
           },
           child: Container(
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
                 color: MyTheme.primaryLightColor,
                 borderRadius: BorderRadius.circular(20)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(provider.isDarkMode()?
                 AppLocalizations.of(context)!.dark
                     :
                 AppLocalizations.of(context)!.light
                     ,
                     style: Theme.of(context).textTheme.titleSmall
                 ),
                 Icon(Icons.arrow_drop_down,size: 30)
               ],
             ),
           ),
         ),
       ],
     ),
    );
  }

  void showLanguageButtomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>LanguageButtomSheet()
    );
  }

  void showThemeButtomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>ThemeButtomSheet()
    );
  }
}