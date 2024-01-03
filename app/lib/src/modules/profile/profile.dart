import 'package:app/src/modules/users/providers/users.p.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/enums.dart';
import '../home/providers/screen.p.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    if (currentUser == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('You are not signed in'),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => ref.read(selectedScreenProvider.notifier).set(Screens.signin),
              child: const Text('Signin')),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text('User ID : ${currentUser.userId} || Name : ${currentUser.name} || Email : ${currentUser.email}'),
        ],
      ),
    );
  }
}
