import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReadingCard extends StatelessWidget {
  final String title;
  final String valueText;
  final double value;
  final Color color;
  final String image;
  const ReadingCard({Key? key, required this.title, required this.valueText, required this.color, required this.value, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 10,
              child: SvgPicture.asset("$image"),
            ),
            SizedBox(height: 5,),
            Text("$title", style: TextStyle(fontSize: 16),),
            SizedBox(height: 4,),
            Text("$valueText"),
            // CircularPercentIndicator(
            //   radius: 60.0,
            //   lineWidth: 5.0,
            //   animation: true,
            //   animationDuration: 1000,
            //   percent: value,
            //   center: Text("${valueText}"),
            //   progressColor: color,
            //   backgroundColor: Colors.grey,
            // ),
          ],
        ),
      ),
    );
  }
}
