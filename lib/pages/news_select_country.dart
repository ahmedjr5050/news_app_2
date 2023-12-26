import 'package:flutter/material.dart';
import 'package:news/shared/sharedd.dart';

class NewsSelectCountry extends StatefulWidget {
  const NewsSelectCountry({super.key});

  @override
  State<NewsSelectCountry> createState() => _NewsSelectCountryState();
}
class _NewsSelectCountryState extends State<NewsSelectCountry> {
  final country=[
    'eg',
    'us',
    'fr',
    'de',
    'it',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Selected'),
      ),
      body:ListView.builder(
        itemCount: country.length,
        itemBuilder: (context, index) {
        
        return  Container(
          color: Colors.white,
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: (){
              saveSelectedCountry(country[index]);
                          },
            child: Row(
              children: [
                Text(country[index],style: TextStyle(fontSize: 18),),
                Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right)),
              ],
            ),
          ),
          
        );
      },),
    );
  }
  
  void saveSelectedCountry(String selectedCountry) {
    PreferenceUtils.setString(PrefKeys.country, selectedCountry,);
    Navigator.pop(context);
  }
}