import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_b/Screens/CarbornFootprint/completed.dart';

import 'cooking.dart';
import 'food.dart';
import 'house.dart';
import 'second_transport.dart';
import 'transportation.dart';

class CarbonSurveyController extends GetxController {
  PageController controller = PageController();
  final currentPage = 1.obs;
  final surveryValues = [].obs;
  final RxDouble transportAnswer = 0.0.obs;
  final RxDouble transportAnswer2 = 0.0.obs;
  final RxDouble foodAnswer = 0.0.obs;
  final RxDouble homeAnswer = 0.0.obs;
  final RxDouble cookingAnswer = 0.0.obs;

  final questionPages = [
    const CarbonTransport(),
    const CarbonTransportCar(),
    const Food(),
    const Cooking(),
    const House(),
    const CompletedCarbonfootprintPage()
  ];

  final questions = {
    1: SurveryQuestion(
      question: 'What kinds of vehicles do you own or regularly use for commuting ( public transportation)?',
      options: [
        SurveryOption(option: 'Petrol Powered vehicles', value: 40),
        SurveryOption(option: 'Bicycles', value: 10),
        SurveryOption(option: 'None of the Above', value: 0),
      ],
    ),
    2: SurveryQuestion(
      question: 'Do you partake in carpooling or ride-sharing for your daily commute or other ?',
      options: [
        SurveryOption(option: 'Yes, regularly', value: 0),
        SurveryOption(option: 'Occasionally', value: 5),
        SurveryOption(option: 'Rarely', value: 10),
        SurveryOption(option: 'Never', value: 20),
      ],
    ),
    3: SurveryQuestion(
      question: 'Do you take steps to minimize food waste through meal planning and leftover utilization?',
      options: [
        SurveryOption(option: 'Always', value: 0),
        SurveryOption(option: 'Often', value: 5),
        SurveryOption(option: 'Occasionally', value: 10),
        SurveryOption(option: 'Rarely', value: 15),
        SurveryOption(option: 'Never', value: 40),
        SurveryOption(option: 'Not Applicable', value: 20),
        SurveryOption(option: 'Prefer Not to Answer', value: 4),
      ],
    ),
    4: SurveryQuestion(
      question: 'What is your source of cooking?',
      options: [
        SurveryOption(option: 'Gas', value: 3),
        SurveryOption(option: 'Kerosene Stove', value: 6),
        SurveryOption(option: 'Electric Cooker', value: 2),
        SurveryOption(option: 'Firewood', value: 12),
        SurveryOption(option: 'Others', value: 8),
      ],
    ),
    5: SurveryQuestion(
      question: 'How many people live in your household?',
      options: [
        SurveryOption(option: '1', value: 1),
        SurveryOption(option: '2', value: 2),
        SurveryOption(option: '3', value: 3),
        SurveryOption(option: '4 - 5', value: 6),
        SurveryOption(option: 'Above 5', value: 14),
        SurveryOption(option: 'None', value: 0),
      ],
    ),
  };
}

class SurveryQuestion {
  final String question;
  final List<SurveryOption> options;

  SurveryQuestion({required this.question, required this.options});
}

class SurveryOption {
  final String option;
  final double value;

  SurveryOption({required this.option, required this.value});
}
