import 'package:inject/inject.dart';
import 'bloc_injector.inject.dart' as g;
import 'bloc_module.dart';
import 'bloc_test.dart';

@Injector(const [BlocModule])
abstract class BlocTestInjector{
  @provide
  BlocTest get app;

  static final create = g.BlocTestInjector$Injector.create;
}