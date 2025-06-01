import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Candleline extends StatelessWidget {
  const Candleline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Line chart",style: TextStyle(color: Colors.white),),
        centerTitle: true),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        height: Get.height,
        width: Get.width,
        child: Container(
          height: Get.height*0.3,
          child: LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  show: true,
                  spots: [
                    //In XX, then Y
                    FlSpot(0, 0),
                    FlSpot(0.5, 0.5),
                    FlSpot(1,1.5),
                    FlSpot(2, 2),
                    FlSpot(3.5, 3),
                    FlSpot(5 , 2.5),
                    FlSpot(6 , 1.5),
                    FlSpot(7, 0.5),
                    FlSpot(8, 1),
                  ],
                   //grad overrieds color
                    color: Colors.green,
                    // gradient:  LinearGradient(
                    //     colors: [
                    //       Colors.red,
                    //       Colors.purpleAccent,
                    //       Colors.greenAccent
                    //     ],
                    //     begin: Alignment.bottomCenter,
                    //     end: Alignment.topCenter),

                  //width of the line
                  barWidth:2,
                  //curved or hard edge, if you want to use hard edge u can make isStrokeejoinedround to true to make edges smooth
                  isCurved: true,
                  //to make peak values not overshoot the border
                  preventCurveOverShooting: true,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.greenAccent,
                    gradient:  LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.greenAccent,
                          Colors.greenAccent
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                  ), //below line
                  aboveBarData: BarAreaData(
                    show: true,
                    color: Colors.grey.shade100.withOpacity(0.8)
                  ),//above line,
                  dotData: FlDotData(
                    show: true,
                    checkToShowDot: (spot, barData){
                      //write code to show only the last dot
                      if (spot.x >= spot.props.any(test)){
                        return true;
                      }
                      else {
                        return false;
                      }
                    }
                  )
                )
              ]
            )
          ),
        )
      ),
    );
  }
}
