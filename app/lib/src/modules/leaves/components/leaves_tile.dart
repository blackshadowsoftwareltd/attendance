import 'package:app/src/modules/leaves/models/leaves.dart';
import 'package:flutter/material.dart';
import 'package:app/src/utils/extensions/time.dart';

class LeavesTile extends StatelessWidget {
  const LeavesTile({
    super.key,
    required this.data,
  });
  final LeaveDetails? data;
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
              Text('ID : ${data!.leaveId}'),
              Text('User ID : ${data!.userId}'),
              Text('Reason : ${data!.leaveReason}'),
              Text('Leave At : ${data!.leaveTime.formatted}'),
            ],
          ),
        ),
      ),
    );
  }
}
