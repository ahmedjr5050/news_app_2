import 'package:flutter/material.dart';
import 'package:news/pages/news_select_country.dart';
import 'package:news/pages/theme.dart';
import 'package:news/shared/sharedd.dart';
import 'package:news/widgets/custom_settings.dart';

class NewsSettings extends StatefulWidget {
  const NewsSettings({super.key});

  @override
  State<NewsSettings> createState() => _NewsSettingsState();
}

class _NewsSettingsState extends State<NewsSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Settings'),
        backgroundColor: const Color(0xffab49fb),
      ),
      body: Column(children: [
        CustomSettings(
            iconData: Icons.language,
            name: 'Country',
            country: PreferenceUtils.getString(PrefKeys.country),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  NewsSelectCountry();
              })).then((value) => setState(() {
              }));
            }),
        CustomSettings(
            iconData: Icons.notifications,
            name: 'Notifactions',
            onTap: () {
            }),
        CustomSettings(
            iconData: Icons.light_mode,
            name: 'Theme',
            country: PreferenceUtils.getString(PrefKeys.theme),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  Themess();
              })).then((value) => setState((
              ) {
              }));
            }),
        CustomSettings(
            iconData: Icons.language,
            name: 'Language',
            country: 'en',
            onTap: () {}),
      ]),
    );
  }
  
}
