import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/users.p.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersData = ref.watch(usersProvider);
    final t = Theme.of(context);
    return usersData.when(
      error: (e, _) => Text(e.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (users) => GridView.builder(
        itemCount: users?.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 7 / 2),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
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
                  Text('ID : ${users![index].userId}'),
                  Text('Name : ${users[index].name}'),
                  Text('Email : ${users[index].email}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
