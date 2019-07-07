import 'package:flutter/material.dart';
import 'src/di/bloc_injector.dart';
import 'src/di/bloc_module.dart';

void main() async {
  var container = await BlocInjector.create(BlocModule());
  runApp(container.app);
}
