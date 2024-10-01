import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';

import '../MyTheme.dart';

class LanguageButtomSheet extends StatefulWidget
{
  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<AppConfigProvider>(context);
   return Container(
     padding: EdgeInsets.all(15),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         InkWell(
           onTap: ()
           {
             provider.changeLanguage('en');

           },
           child: provider.appLanguage=='en'?
               getSelectedItemWidget(AppLocalizations.of(context)!.english)
               :
               getUnSelectedItemWidget(AppLocalizations.of(context)!.english)
         ),
         SizedBox(height: 15),

         InkWell(
           onTap: (){
             provider.changeLanguage('ar');

           },
           child:provider.appLanguage == 'ar'?
               getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
               :
               getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic)
         ),
       ],
     ),
   );
  }

  Widget getSelectedItemWidget(String text) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold

          ),
        ),
        Icon(Icons.check,
          size: 35,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
  
  Widget getUnSelectedItemWidget (String text) {
    return Text(text,
      style:provider.isDarkMode()?
      Theme.of(context).textTheme.titleSmall?.copyWith(
          color: MyTheme.blackColor
      ):
      Theme.of(context).textTheme.titleSmall,
    );
}
}