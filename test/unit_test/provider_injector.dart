import 'package:inject/inject.dart';
import 'provider_injector.inject.dart' as g;
import 'provider_module.dart';
import 'provider_test.dart';

@Injector(const [ProviderModule])
abstract class ProviderTestInjector{
  @provide
  ProviderTest get app;

  static final create = g.ProviderTestInjector$Injector.create;
}