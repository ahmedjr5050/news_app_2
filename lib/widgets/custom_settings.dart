import 'package:flutter/material.dart';

class CustomSettings extends StatelessWidget {
  const CustomSettings({required this.iconData,required this.name,this.country='', required this.onTap,Key? key}) : super(key: key);
final  IconData iconData;
 final String name;
 final String country;
 final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: onTap,
            child: Container(
              height: 100,
              color: Colors.brown,
              padding:const EdgeInsets.all(10),
              margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child:  Row(
                children: [
                  Icon(iconData,color:Colors.amber,size: 30,),
                  const SizedBox(width: 5,),
                  Text(name,style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue
                  ),),
                  const Spacer(),
                  Text(country,style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,color: Colors.blue
                  ),),
                  const SizedBox(width: 5,),
                  const Icon(Icons.keyboard_arrow_right_rounded,color: Colors.blue,),
                ]
              ),
            ),
          
    );
  }
}