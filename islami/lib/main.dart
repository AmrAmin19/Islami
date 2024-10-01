import 'package:flutter/material.dart';
import 'package:islami/HadethDetailsScreen.dart';
import 'package:islami/HomeScreen.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/SuraDetailsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/appConfigProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName:(context)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName : (context) => HadethDetailsScreen()

      },
      theme: MyTheme.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }

}
