import 'package:app/src/modules/users/models/users.dart';
import 'package:flutter/material.dart';

class CheckinsUserTile extends StatelessWidget {
  const CheckinsUserTile({
    super.key,
    required this.user,
  });
  final UserInfo? user;
  @override
  Widget build(BuildContext context) {
    if (user == null) return const SizedBox.shrink();

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
              Text('ID : ${user!.userId}'),
              Text('Name : ${user!.name}'),
              Text('Email : ${user!.email}'),
            ],
          ),
        ),
      ),
    );
  }
}
