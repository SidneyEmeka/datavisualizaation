import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Candleline extends StatelessWidget {
  const Candleline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Data Visualization",style: TextStyle(color: Colors.white),),
          centerTitle: true),
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height*0.6,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      //add as many liines  as you like
                      LineChartBarData(
                        show: true,
                        spots: [
                          //In XX, then Y
                          const FlSpot(0, 0),
                          const FlSpot(0.5, 0.5),
                          const FlSpot(1,1.5),
                          const FlSpot(2, 2),
                          const FlSpot(3.5, 3),
                          const FlSpot(5 , 2.5),
                          const FlSpot(6 , 1.5),
                          const FlSpot(7, 0.5),
                          const FlSpot(8, 1),
                          const FlSpot(11, 0.8),
                          const FlSpot(12, 2),
                          const FlSpot(13, 1.2),
                          const FlSpot(14, 1.5),
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
                        barWidth:3,
                        //curved or hard edge, if you want to use hard edge u can make isStrokeejoinedround to true to make edges smooth
                        isCurved: true,
                        //to make peak values not overshoot the border
                        preventCurveOverShooting: true,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient:  const LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.greenAccent,
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.centerRight),
                        ), //below line
                        aboveBarData: BarAreaData(
                          show: true,
                          color: Colors.grey.shade100.withOpacity(0.8)
                        ),//above line,
                        dotData: FlDotData(
                          show: true, //if you want the dots to show at all
                          checkToShowDot: (spot, barData){
                            //write code to show only the last dot
                            return spot.x == barData.spots.last.x;
                          },
                            ///to  customize the points
                          // getDotPainter: (FlSpot spot, double xPercentage,
                          // LineChartBarData bar, int index, {double? size}){
                          //   return FlDotCirclePainter( //can be dot or cross
                          //     color: Colors.green,
                          //     radius: 20
                          //   );
                          // }

                        ),
                        //dashArray: [1,5,9,20] //to make it dotted, first value is line length,second value is space length and  so on, just use first two only sha
                      ),
                    ],
                    titlesData: const FlTitlesData(
                      show: true, //to show the co-ordinates[values]
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false
                        )
                      ),
                      topTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: false
                            )
                        ),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                            reservedSize: 30,

                          )
                      ),
                    ),
                    //if you want to mark a particular value
                    // extraLinesData: ExtraLinesData(
                    //   horizontalLines: [
                    //     HorizontalLine(y: 2)
                    //   ],
                    //   verticalLines: [
                    //     VerticalLine(x: 7)
                    //   ],
                    //   extraLinesOnTop: false, //z-index
                    // ),
                    lineTouchData: LineTouchData(
                      getTouchedSpotIndicator: (barData, indicators){
                        return indicators.map((int index) {
                          /// Indicator Line
                          var lineColor = barData.gradient?.colors.first ?? barData.color;
                          if (barData.dotData.show) {
                            lineColor = Colors.green;
                          }
                          const lineStrokeWidth = 2.0;
                          final flLine = FlLine(color: lineColor, strokeWidth: lineStrokeWidth);

                          var dotSize = 10.0;
                          if (barData.dotData.show) {
                            dotSize = 1;
                          }

                          final dotData = const FlDotData(
                          show: true
                          );

                          return TouchedSpotIndicatorData(flLine, dotData);
                        }).toList();
                      },
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipColor: (spot){
                          return Colors.green;
                        },
                        getTooltipItems: (item){
                          return item.map((LineBarSpot touchedSpot) {
                            const textStyle = TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            );
                            return LineTooltipItem(touchedSpot.y.toString(), textStyle);
                          }).toList();
                        },

                      ),
                    ),
                    //grid lines
                    gridData: const FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 0.2
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        bottom: BorderSide(color: Colors.green),
                        left: BorderSide(color: Colors.green),
                      )
                    ),
                    //for Mins and Maxs of X and Y it determines how  long or  wide it should draw your chart, when not provided it uses the your data's max  and min values
                    maxY: 4,
                    backgroundColor: Colors.green.withOpacity(0.5)
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const Text("Line Chart",style:TextStyle(fontWeight: FontWeight.w500,color: Colors.black),)
            ],
          )
        ),
      ),
    );
  }
}
