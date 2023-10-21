import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Provider/Authentication/auth_provider.dart';
import '../../../Styles/colors.dart';
import '../../../Utils/page_service.dart';

class EnviromentalProgress extends StatefulWidget {
  const EnviromentalProgress({Key? key}) : super(key: key);

  @override
  State<EnviromentalProgress> createState() => _EnviromentalProgressState();
}

class _EnviromentalProgressState extends State<EnviromentalProgress> {
  Color carbonFootprintColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthenticationProvider>(context).currentUser;
    double totalCarbonFootprint = user.profile.carbonFootprint;
    bool showWarning = totalCarbonFootprint > 50;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Environmental Progress",
          style: PageService.bigHeaderStyle,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 30, left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.whiteSmokeColor,
                          blurRadius: 3,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SfCircularChart(
                      legend: Legend(isVisible: true), // Enable the legend
                      title: ChartTitle(
                        alignment: ChartAlignment.near,
                        text: 'Environmental Statics',
                        textStyle: PageService.labelStyle,
                      ),
                      series: <CircularSeries>[
                        PieSeries<UserData, String>(
                          dataSource: <UserData>[
                            UserData('Carbon ',
                                user.profile.carbonFootprint, Colors.red),
                            UserData('Transport', user.profile.transport,
                                Colors.green),
                            UserData('Energy ', user.profile.home,
                                Colors.orange),
                            UserData('Food Choices', user.profile.food,
                                Colors.purple),
                            UserData('Awareness',
                                user.profile.bushBurning, Colors.yellow),
                          ],
                          xValueMapper: (UserData data, _) => data.category,
                          yValueMapper: (UserData data, _) => data.value,
                          pointColorMapper: (UserData data, _) => data.color,
                          dataLabelMapper: (UserData data, _) {
                            if (data.category == 'Carbon Footprint') {
                              final totalCarbonFootprint =
                                  user.profile.carbonFootprint;
                              if (totalCarbonFootprint > 50) {
                                return 'Warning: ${data.category}: $totalCarbonFootprint';
                              }
                            }
                            return '${data.category}: ${data.value}';
                          },
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                  PageService.textSpaceL,
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 100,
                    ),
                    title: ChartTitle(
                      alignment: ChartAlignment.near,
                      text: 'Environmental Progress',
                      textStyle: PageService.labelStyle,
                    ),
                    // Enable the legend
                    series: <ChartSeries>[
                      ColumnSeries<UserData, String>(
                        dataSource: <UserData>[
                          UserData('Carbon ',
                              user.profile.carbonFootprint, Colors.red),
                          UserData('Transport', user.profile.transport,
                              Colors.green),
                          UserData('Energy ', user.profile.home,
                              Colors.orange),
                          UserData('Food ', user.profile.food,
                              Colors.purple),
                          UserData('Awareness ',
                              user.profile.bushBurning, Colors.yellow),
                        ],
                        xValueMapper: (UserData data, _) => data.category,
                        yValueMapper: (UserData data, _) => data.value,
                        pointColorMapper: (UserData data, _) {
                          if (data.category == 'Carbon Footprint' &&
                              showWarning) {
                            return Colors
                                .red; // Show in red if value is greater than 50
                          } else {
                            return Color(
                                0xff358749); // Show in blue for other values
                          }
                        },
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                  )

// ... Your existing code ...

// ... Your existing code ...
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserData {
  final String category;
  final double value;
  final Color color;

  UserData(this.category, this.value, this.color);
}
