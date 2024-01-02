import 'package:app/src/modules/checkins/providers/checkin.p.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/checkin_checkout_tile.dart';
import 'components/checkin_details_tile.dart';
import 'components/checkin_user_tile.dart';

class CheckInScreen extends ConsumerWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkins = ref.watch(checkinsProvider);
    return Column(
      children: [
        const _Header(),
        Expanded(
          child: checkins.when(
            error: (e, _) => Center(child: Text(e.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (data) => ListView.builder(
              itemCount: data?.length,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckinsDetailsTile(data: data![index].checkin),
                    const SizedBox(width: 20),
                    CheckinsUserTile(user: data[index].userInfo),
                    const SizedBox(width: 20),
                    CheckinsCheckoutTile(data: data[index].checkout),
                  ],
                ),
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
