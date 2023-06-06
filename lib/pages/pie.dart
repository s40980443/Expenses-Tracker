import 'package:flutter/material.dart';

//pages
import 'package:my_app4/pages/add.dart';
import 'package:my_app4/pages/analysis.dart';
import 'package:my_app4/pages/calendar.dart';
import 'package:my_app4/pages/setting.dart';


//pie
import 'pie/chart_container.dart';
import 'pie/pie_chart.dart';
import 'pie/pie_chart_data.dart';



class Pie extends StatefulWidget{
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie>{
@override
  Widget build(BuildContext context){
    return Center(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          children: <Widget>[
            ChartContainer(
              title: 'title', 
              color: Color(0xff24b273),
              chart: PieChartContent()
              
              )
              
          ],
          
        ),
    );
  }
}

// class HomePage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return Center(
//         child: ListView(
//           padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
//           children: <Widget>[
//             ChartContainer(
//               title: 'title', 
//               color: Color(0xff24b273),
//               chart: PieChartContent()
              
//               )
              
//           ],
          
//         ),
//     );
//   }
// }