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
  bool showWarning = true;

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
                  top: 0, bottom: 0, left: 10, right: 10),
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: SfCircularChart(
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
                        if (user.profile.carbonFootprint > 50)
                          Center(
                            child: Text(
                              'Carbon Footprint value is too high!\ntake major action',
                              style: TextStyle(color: Colors.red, fontSize: 18),

                            ),
                          ),
                        PageService.textSpaceL,
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
                          if (data.category == 'Carbon ' && user.profile.carbonFootprint > 50) {
                            return Colors.red; // Show the "Carbon" data in red if value is greater than 50
                          } else {
                            return data.color; // Use the specified colors for other data
                          }
                        },
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),




                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void showErrorMessage() {
    final user = Provider.of<AuthenticationProvider>(context).currentUser;
    if (showWarning && user.profile.carbonFootprint > 50) {
      Text("Carbon Footprint value is too high!");
    }
  }
}

class UserData {
  final String category;
  final double value;
  final Color color;

  UserData(this.category, this.value, this.color);
}
