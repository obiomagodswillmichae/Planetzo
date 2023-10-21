import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Utils/page_service.dart';

class UserData {
  final String category;
  final double value;
  final Color color;

  UserData(this.category, this.value, this.color);
}

class UserProfile {
  final String userName;
  final double carbonFootprint;
  final double transport;
  final double home;
  final double food;
  final double bushBurning;

  UserProfile(this.userName, this.carbonFootprint, this.transport, this.home, this.food, this.bushBurning);
}

class EnvironmentalStatisticsScreen extends StatelessWidget {
  // Example user profiles
  final List<UserProfile> users = [
    UserProfile('User1', 30.0, 20.0, 15.0, 10.0, 5.0),
    UserProfile('User2', 40.0, 25.0, 12.0, 15.0, 8.0),
    // Add more user profiles as needed
  ];

  List<UserData> buildDataSource(UserProfile user) {
    return <UserData>[
      UserData('Carbon ', user.carbonFootprint, Colors.red),
      UserData('Transport', user.transport, Colors.green),
      UserData('Energy ', user.home, Colors.orange),
      UserData('Food Choices', user.food, Colors.purple),
      UserData('Awareness', user.bushBurning, Colors.yellow),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        title: Text('Community Statics', style: PageService.bigHeaderStyle,),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: users.map((user) {
              return Column(
                children: [
                  Text('User Profile for ${user.userName}'),
                  SfCircularChart(
                    title: ChartTitle(
                      alignment: ChartAlignment.near,
                      text: 'Environmental Statics',
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    series: <CircularSeries>[
                      PieSeries<UserData, String>(
                        dataSource: buildDataSource(user),
                        xValueMapper: (UserData data, _) => data.category,
                        yValueMapper: (UserData data, _) => data.value,
                        pointColorMapper: (UserData data, _) => data.color,
                        dataLabelMapper: (UserData data, _) {
                          if (data.category == 'Carbon ') {
                            final totalCarbonFootprint = user.carbonFootprint;
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
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
