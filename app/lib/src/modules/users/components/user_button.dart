import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/users.dart';
import '../providers/users.p.dart';

class UserButton extends ConsumerWidget {
  const UserButton({
    super.key,
    required this.user,
    required this.ctrl,
  });
  final OverlayPortalController ctrl;
  final UserInfo user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Theme.of(context);
    final overlay = ref.read(overlayUserProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: t.scaffoldBackgroundColor,
        onPressed: () {
          // ctrl.hide();
          overlay.set(user);
          ctrl.show();
        },
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID : ${user.userId}'),
              Text('Name : ${user.name}'),
              Text('Email : ${user.email}'),
            ],
          ),
        ),
      ),
    );
  }
}
