import 'package:atlas/atlas.dart';

class AtlasProvider {
  Provider _provider;

  AtlasProvider._();

  static final AtlasProvider _instance = AtlasProvider._();
  static Provider get instance => _instance._provider;
  static set instance(Provider p) {
    _instance._provider = p;
  }
}
