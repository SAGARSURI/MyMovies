import 'package:inject/inject.dart';
import 'bloc_injector.inject.dart' as g;
import '../app.dart';
import 'bloc_module.dart';

@Injector(const [BlocModule])
abstract class BlocInjector{
  @provide
  App get app;

  static final create = g.BlocInjector$Injector.create;
}