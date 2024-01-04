import 'package:app/src/components/snack.dart';
import 'package:app/src/modules/profile/providers/provider.p.dart';
import 'package:app/src/utils/extensions/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TakeCheckins extends ConsumerWidget {
  const TakeCheckins({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkin = ref.watch(currentChckinsProvider);
    final time = ref.watch(chckinsTimeProvider);
    return Expanded(
      child: SizedBox(
        height: 200,
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: checkin != null
                ? Center(child: Text('You have checked in at ${checkin.checkInTime.formatted}'))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(alignment: Alignment.centerLeft, child: Text('Check In')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(time == null ? 'Select Time' : time.formatted),
                          FilledButton(
                            onPressed: () async => ref.read(chckinsTimeProvider.notifier).pick(context),
                            child: const Text('Pick Time'),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton(
                          onPressed: () async {
                            final error = await ref.read(currentChckinsProvider.notifier).checkin();
                            if (error != null) {
                              if (context.mounted) showErrorMessage(context, error);
                            }
                          },
                          child: const Text('Check In'),
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
