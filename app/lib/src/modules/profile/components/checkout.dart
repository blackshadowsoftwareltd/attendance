import 'package:app/src/components/snack.dart';
import 'package:app/src/utils/extensions/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/provider.p.dart';

class TakeCheckout extends ConsumerWidget {
  const TakeCheckout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkin = ref.watch(currentChckinsProvider);
    final checkout = ref.watch(currentChckoutsProvider);
    final time = ref.watch(chckoutTimeProvider);
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: checkout != null
                ? Center(child: Text('You have last checked out at ${checkout.checkOutTime!.formatted}'))
                : checkin == null
                    ? const Center(child: Text('You have not checked in yet'))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(alignment: Alignment.centerLeft, child: Text('Check Out')),
                          Center(child: Text('You have checked in at ${checkin.checkInTime!.formatted}')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(time == null ? 'Select Time' : time.formatted),
                              FilledButton(
                                onPressed: () async => ref.read(chckoutTimeProvider.notifier).pick(context),
                                child: const Text('Pick Time'),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FilledButton(
                              onPressed: () async {
                                final error = await ref.read(currentChckoutsProvider.notifier).checkout();
                                if (error != null) {
                                  if (context.mounted) showErrorMessage(context, error);
                                }
                              },
                              child: const Text('Check Out'),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
