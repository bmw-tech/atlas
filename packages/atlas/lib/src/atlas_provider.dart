import 'package:atlas/atlas.dart';

/// The `AtlasProvider` maintains the `Provider` instance that will be used
/// with the `Atlas` widget. `AtlasProvider` is a singleton and should be configured
/// to use the desired `Provider` before the `Atlas` widget is rendered.
class AtlasProvider {
  Provider _provider;

  AtlasProvider._();

  static final AtlasProvider _instance = AtlasProvider._();

  /// Getter for the `Provider` instance
  static Provider get instance => _instance._provider;

  /// Setter for the `Provider` instance
  static set instance(Provider p) {
    _instance._provider = p;
  }
}
