import 'package:app/src/modules/checkins/models/checkout.dart';
import 'package:flutter/material.dart';

class CheckinsCheckoutTile extends StatelessWidget {
  const CheckinsCheckoutTile({
    super.key,
    required this.data,
  });
  final CheckoutDetails? data;
  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox.shrink();

    final t = Theme.of(context);
    return Expanded(
      flex: 1,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: t.scaffoldBackgroundColor,
        onPressed: () {},
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID : ${data!.checkOutId}'),
              Text('Checkin ID : ${data!.checkInId}'),
              Text('Checkout Time : ${data!.checkOutTime}'),
            ],
          ),
        ),
      ),
    );
  }
}
