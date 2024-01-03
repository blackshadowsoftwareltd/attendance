import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/users.p.dart';

class OverlayDialog extends ConsumerWidget {
  const OverlayDialog({super.key, required this.ctrl});
  final OverlayPortalController ctrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(overlayUserProvider);

    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => ctrl.hide(),
        child: user == null ? const CircularProgressIndicator() : Text(user.name ?? ''),
      ),
    );
  }
}
