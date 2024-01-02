import 'package:intl/intl.dart';

extension TimeExt on DateTime? {
  String get formatted => this == null ? '' : DateFormat.yMd().add_jm().format(this!);
}
