import 'package:flutter/material.dart';
import 'package:news/main.dart';
import 'package:news/shared/sharedd.dart';

class Themess extends StatefulWidget {
  const Themess({Key? key}) : super(key: key);

  @override
  State<Themess> createState() => _ThemessState();
}

class _ThemessState extends State<Themess> {
  final themes = ['Dark', 'Light'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
      ),
      body: ListView.builder(
        itemCount: themes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              saveSelectedTheme(themes[index]);
            },
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    themes[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void saveSelectedTheme(String selectedTheme) async {
    await PreferenceUtils.setString(PrefKeys.theme, selectedTheme);
    MyAppState.instance?.setTheme();
    Navigator.pop(context);
    print(PreferenceUtils.getString(PrefKeys.theme));
  }
}
