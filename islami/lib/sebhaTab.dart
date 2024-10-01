import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget
{

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter=0;
  double rotationAngle = 0.0;
  int tasbeehCounter =0;
  List<String> tasbeeh=["الله اكبر","استغفر الله","الحمد لله","سبحان الله"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Container(
         // margin: EdgeInsets.only(top: 7),
            child: Image.asset('assets/images/head_sebha_logo.png'))),
        Center(child:
        InkWell(
          onTap: (){
            rotationAngle += 30;

            if(counter < 33 ){
              counter+=1;
            }
            else
            {
              tasbeehCounter += 1;
              counter=0;
            }
            if(tasbeehCounter==tasbeeh.length){tasbeehCounter=0;}

            setState(() {

            });
          } ,
            child:Transform.rotate(
                angle: rotationAngle * (3.14159 / 180),
                child: Image.asset('assets/images/body_sebha_logo.png')))),
        Container(
          margin: EdgeInsets.only(top: 30,bottom:30),
          child: Text('عدد التسبيحات',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          height:70 ,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xffB7935F)
          ),
          child: Text('${counter.toString()}',textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
        ),

        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xffB7935F)
          ),
          child: Text(tasbeeh[tasbeehCounter],textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }

}