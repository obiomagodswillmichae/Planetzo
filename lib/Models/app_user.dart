import 'package:planet_b/Utils/db_constants.dart';

class AppUser {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String userName;
  final UserProfile profile;

  AppUser({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userName,
    required this.profile,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      userId: json[DbConstants.userId],
      firstName: json[DbConstants.firstName],
      lastName: json[DbConstants.lastName],
      email: json[DbConstants.email],
      userName: json[DbConstants.userName],
      profile: UserProfile.fromJson(json[DbConstants.profile],)
    );
  }

  static Map<String, dynamic> toJson(AppUser user) {
    return {
      DbConstants.firstName: user.firstName,
      DbConstants.lastName: user.lastName,
      DbConstants.email: user.email,
      DbConstants.userName: user.userName,
      DbConstants.userId: user.userId,
      DbConstants.profile: UserProfile.toJson(user.profile),
    };
  }
}

class UserProfile {
  final double steps;
  final double climateAction;
  final double carbonFootprint;
  final double transport;
  final double home;
  final double food;
  final double bushBurning;

  UserProfile(
      {this.steps = 0,
      this.climateAction = 0,
      this.carbonFootprint = 0,
      this.transport = 0,
      this.home = 0,
      this.food = 0,
      this.bushBurning = 0});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        steps: json[DbConstants.steps],
        carbonFootprint: json[DbConstants.carbonFootprint],
        bushBurning: json[DbConstants.bushBurning],
        climateAction: json[DbConstants.climateAction],
        food: json[DbConstants.food],
        home: json[DbConstants.home],
        transport: json[DbConstants.transport],
      );

  static Map<String, dynamic> toJson(UserProfile profile) {
    return {
      DbConstants.steps: profile.steps,
      DbConstants.carbonFootprint: profile.carbonFootprint,
      DbConstants.bushBurning: profile.bushBurning,
      DbConstants.climateAction: profile.climateAction,
      DbConstants.food: profile.food,
      DbConstants.home: profile.home,
      DbConstants.transport: profile.transport,
    };
  }
}
