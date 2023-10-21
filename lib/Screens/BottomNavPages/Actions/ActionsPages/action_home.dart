import 'package:flutter/material.dart';
import 'package:planet_b/Utils/app_route.dart';
import 'package:planet_b/Utils/page_service.dart';
import 'package:planet_b/Widgets/custom_button.dart';

import '../../../../Styles/colors.dart';
import '../tips_screen.dart';

class ActionsPage extends StatefulWidget {
  @override
  _ActionsPageState createState() =>
      _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  // Define the variables that will store the user's inputs
  double _carMileage = 0;
  double _carUsageTime = 0;
  double _publicTransportUsageTime = 0;
  double _flightsPerYear = 0;
  double _meatConsumption = 0;
  double _plasticUsage = 0;
  double _electricityUsage = 0;

  // Define the variables that will store the carbon footprint calculations
  double _carCarbonFootprint = 0;
  double _publicTransportCarbonFootprint = 0;
  double _flightsCarbonFootprint = 0;
  double _meatCarbonFootprint = 0;
  double _plasticCarbonFootprint = 0;
  double _electricityCarbonFootprint = 0;
  double _totalCarbonFootprint = 0;

  // Define the function that will calculate the carbon footprint
  void _calculateCarbonFootprint() {
    // Calculate the carbon footprint for each input
    _carCarbonFootprint = _carMileage * _carUsageTime * 0.42;
    _publicTransportCarbonFootprint = _publicTransportUsageTime * 0.09;
    _flightsCarbonFootprint = _flightsPerYear * 0.24;
    _meatCarbonFootprint = _meatConsumption * 2.5;
    _plasticCarbonFootprint = _plasticUsage * 0.11;
    _electricityCarbonFootprint = _electricityUsage * 1.35;

    // Calculate the total carbon footprint
    _totalCarbonFootprint = _carCarbonFootprint +
        _publicTransportCarbonFootprint +
        _flightsCarbonFootprint +
        _meatCarbonFootprint +
        _plasticCarbonFootprint +
        _electricityCarbonFootprint;

    if (_totalCarbonFootprint < 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Great job!", style: PageService.headerStyle,),
            content: const Text(
                "Your carbon footprint is less than 10 tons of CO2 per year."),
            actions: [
              TextButton(
                child: Text("OK", style: PageService.labelStyle,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    } else {
      double treesToPlant = (_totalCarbonFootprint - 10) / 0.6;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("You can do better!",style: PageService.headerStyle,),
            content: Text(
                "Your carbon footprint is ${_totalCarbonFootprint.toStringAsFixed(2)} tons of CO2 per year. You should plant ${treesToPlant.toStringAsFixed(0)} trees per year to offset your carbon emissions."),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
                nextPage(context, page: CarbonFootprintTipsScreen());
              }, child: Text("Tips", style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryColor),)),
              TextButton(
                child: Text("OK", style: PageService.labelStyle,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }

    // Update the UI with the new values
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primaryColor,
        onPressed:  _calculateCarbonFootprint, label: Text("Calculate", style: PageService.whitelabelStyle,) ,),
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: AppColor.black,),
        title: Text("Action", style: PageService.bigHeaderStyle,),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:  Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Enter your information to calculate your carbon footprint:',
                    style: PageService.labelStyle,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Car mileage (miles per gallon)',
                    ),
                    onChanged: (value) {
                      _carMileage = double.tryParse(value) ?? 0;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Car usage time (hours per week)',
                    ),
                    onChanged: (value) {
                      _carUsageTime = double.tryParse(value) ?? 0;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Public transport usage time (hours per week)',
                    ),
                    onChanged: (value) {
                      _publicTransportUsageTime = double.tryParse(value) ?? 0;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Flights per year',
                    ),
                    onChanged: (value) {
                      _flightsPerYear = double.tryParse(value) ?? 0;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Meat consumption (pounds per week)',
                    ),
                    onChanged: (value) {
                      _meatConsumption = double.tryParse(value) ?? 0;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Plastic usage (pounds per week)',
                    ),
                    onChanged: (value) {
                      _plasticUsage = double.tryParse(value) ?? 0;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Electricity usage (kilowatt-hours per month)',
                    ),
                    onChanged: (value) {
                      _electricityUsage = double.tryParse(value) ?? 0;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  // customButton(context, onTap:  _calculateCarbonFootprint, text: 'Calculate', bgColor: AppColor.primaryColor, textColor: AppColor.white),
                  const SizedBox(height: 16.0),
                  Text(
                    'Your carbon footprint is:',
                    style: PageService.labelStyle,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${_totalCarbonFootprint.toStringAsFixed(2)} tons of CO2 per year',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  PageService.textSpacexxL,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
