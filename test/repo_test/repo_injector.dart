import 'package:inject/inject.dart';
import 'repo_injector.inject.dart' as g;
import 'repo_module.dart';
import 'repo_test.dart';

@Injector(const [RepoModule])
abstract class RepoTestInjector{
  @provide
  RepoTest get app;

  static final create = g.RepoTestInjector$Injector.create;
}