import 'package:app/src/modules/breaks/components/break_tile.dart';
import 'package:app/src/modules/breaks/providers/breaks.p.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../checkins/components/checkin_user_tile.dart';

class BreaksScreen extends ConsumerWidget {
  const BreaksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ata = ref.watch(breaksProvider);
    return Column(
      children: [
        const _Header(),
        Expanded(
          child: ata.when(
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
                    BreakDetailsTile(data: data![index].breaks),
                    const SizedBox(width: 20),
                    CheckinsUserTile(user: data[index].userInfo),
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
            'Break Details',
            textAlign: TextAlign.center,
          )),
          SizedBox(width: 20),
          Expanded(
              child: Text(
            'User Details',
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
