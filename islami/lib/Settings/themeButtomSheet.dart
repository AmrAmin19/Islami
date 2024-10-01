import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';

class ThemeButtomSheet extends StatefulWidget
{
  @override
  State<ThemeButtomSheet> createState() => _ThemeButtomSheetState();
}

class _ThemeButtomSheetState extends State<ThemeButtomSheet> {
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
                provider.changeTheme(ThemeMode.dark);

              },
              child: provider.isDarkMode()?
              getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  :
              getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
          ),
          SizedBox(height: 15),

          InkWell(
              onTap: (){
                provider.changeTheme(ThemeMode.light);

              },
              child:provider.isDarkMode()?
              getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
                  :
               getSelectedItemWidget(AppLocalizations.of(context)!.light)
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