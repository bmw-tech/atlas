/// Map styles to display

class MapStyle {
  final String? light;
  final String? dark;
  final String? satellite;

  MapStyle({this.light, this.dark, this.satellite});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is MapStyle) return light == other.light && dark == other.dark && satellite == other.satellite;
    return false;
  }

  @override
  int get hashCode => light.hashCode ^ dark.hashCode ^ satellite.hashCode;
}
