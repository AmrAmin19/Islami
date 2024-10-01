import 'package:flutter/material.dart';
import 'package:islami/MyTheme.dart';

class RadioTab extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height*0.16,
                bottom: MediaQuery.of(context).size.height*0.06
            ),
              child: Image.asset('assets/images/radio_image.png')),
        ),
        Container(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.06),
          child: Text('إذاعة القرآن الكريم',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous,color: MyTheme.primaryLightColor),
            SizedBox(width: 20),
            Icon(Icons.play_arrow_rounded,color: MyTheme.primaryLightColor,size: 50),
            SizedBox(width: 20),
            Icon(Icons.skip_next,color: MyTheme.primaryLightColor)
          ],
        )
      ],
    );
  }

}