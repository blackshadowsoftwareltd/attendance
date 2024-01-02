import 'package:app/src/modules/checkins/models/checkin.dart';
import 'package:app/src/modules/checkins/models/checkout.dart';
import 'package:app/src/modules/users/models/users.dart';
import 'package:flutter/material.dart';

import 'components/checkin_checkout_tile.dart';
import 'components/checkin_details_tile.dart';
import 'components/checkin_user_tile.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Header(),
        Expanded(
          child: ListView.builder(
            itemCount: 20,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CheckinsDetailsTile(data: CheckinDetails()),
                  const SizedBox(width: 20),
                  CheckinsUserTile(user: UserInfo()),
                  const SizedBox(width: 20),
                  CheckinsCheckoutTile(data: CheckoutDetails()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            'Checkin Details',
            textAlign: TextAlign.center,
          )),
          SizedBox(width: 20),
          Expanded(
              child: Text(
            'User Details',
            textAlign: TextAlign.center,
          )),
          SizedBox(width: 20),
          Expanded(
              child: Text(
            'Checkout Details',
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
