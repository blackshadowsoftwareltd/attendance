import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/enums.dart';

part 'screen.p.g.dart';

@riverpod
class SelectedScreen extends _$SelectedScreen {
  @override
  Screens build() => Screens.home;

  void set(Screens s) => state = s;
}
