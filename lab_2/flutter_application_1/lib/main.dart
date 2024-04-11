import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/common/di.dart';
import 'package:flutter_application_1/shared/widgets/one_app.dart';

Future<void> main() async {
  await reinitApi();
  runApp(OneApp());
}
