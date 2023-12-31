import 'package:app/src/modules/breaks/breaks.dart';
import 'package:app/src/modules/home/home.dart';
import 'package:app/src/modules/leaves/leaves.dart';
import 'package:app/src/modules/signing/signin.dart';
import 'package:app/src/modules/users/users.dart';
import 'package:flutter/material.dart';

import '../modules/checkins/checkin.dart';

enum Screens {
  home,
  users,
  profile,
  signin,
  checkins,
  breaks,
  leaves;

  Widget get screen => switch (this) {
        Screens.home => const HomeScreen(),
        Screens.signin => const SigninScreen(),
        Screens.profile => const Placeholder(),
        Screens.users => const UsersScreen(),
        Screens.checkins => const CheckInScreen(),
        Screens.breaks => const BreaksScreen(),
        Screens.leaves => const LeaveScreen(),
      };

  String get title => switch (this) {
        Screens.home => 'Home',
        Screens.signin => 'Signin',
        Screens.profile => 'Profile',
        Screens.users => 'Users',
        Screens.checkins => 'Checkins',
        Screens.breaks => 'Breaks',
        Screens.leaves => 'Leaves',
      };
}
