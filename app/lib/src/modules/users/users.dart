import 'package:app/src/modules/users/components/user_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/overlay_dialog.dart';
import 'providers/users.p.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersData = ref.watch(usersProvider);
    final ctrl = ref.read(overlayCTRLProvider);
    return usersData.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (users) => OverlayPortal(
        controller: ctrl,
        overlayChildBuilder: (BuildContext context) => OverlayDialog(
          ctrl: ctrl,
        ),
        child: GridView.builder(
          itemCount: users?.length,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 7 / 2),
          itemBuilder: (context, index) => UserButton(user: users![index], ctrl: ctrl),
        ),
      ),
    );
  }
}
