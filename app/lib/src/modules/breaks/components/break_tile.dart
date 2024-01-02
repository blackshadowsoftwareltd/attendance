import 'package:app/src/modules/breaks/models/breaks.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/extensions/time.dart';

class BreakDetailsTile extends StatelessWidget {
  const BreakDetailsTile({
    super.key,
    required this.data,
  });
  final BreakDetails? data;
  @override
  Widget build(BuildContext context) {
    if (data == null) return const Expanded(flex: 1, child: SizedBox.shrink());

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
              Text('ID : ${data!.breakId}'),
              Text('User ID : ${data!.userId}'),
              Text('Reason Time : ${data!.breakReason}'),
              Text('Start At : ${data!.startAt.formatted}'),
              Text('End At : ${data!.endAt.formatted}'),
            ],
          ),
        ),
      ),
    );
  }
}
