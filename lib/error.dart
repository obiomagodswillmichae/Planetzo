// import 'package:flutter/material.dart';
//
// class YourWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       primaryXAxis: CategoryAxis(),
//       primaryYAxis: NumericAxis(
//         minimum: 0,
//         maximum: 100,
//       ),
//       title: ChartTitle(
//         alignment: ChartAlignment.near,
//         text: 'Environmental Progress',
//         textStyle: PageService.labelStyle,
//       ),
//       // Enable the legend
//       series: <ChartSeries>[
//         ColumnSeries<UserData, String>(
//           dataSource: <UserData>[
//             UserData('Carbon ',
//                 user.profile.carbonFootprint, Colors.red),
//             UserData('Transport', user.profile.transport,
//                 Colors.green),
//             UserData('Energy ', user.profile.home,
//                 Colors.orange),
//             UserData('Food ', user.profile.food,
//                 Colors.purple),
//             UserData('Awareness ',
//                 user.profile.bushBurning, Colors.yellow),
//           ],
//           xValueMapper: (UserData data, _) => data.category,
//           yValueMapper: (UserData data, _) => data.value,
//           pointColorMapper: (UserData data, _) {
//             if (data.category == 'Carbon ' && user.profile.carbonFootprint > 50) {
//               return Colors.red; // Show the "Carbon" data in red if value is greater than 50
//             } else {
//               return data.color; // Use the specified colors for other data
//             }
//           },
//           dataLabelSettings: DataLabelSettings(isVisible: true),
//         ),
//       ],
//     );
//   }
// }
//
// class UserData {
//   final String category;
//   final int value;
//   final Color color;
//
//   UserData(this.category, this.value, this.color);
// }
