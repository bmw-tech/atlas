/// Map styles to display

class MapStyle {
  final String? light;
  final String? dark;
  final String? lightSatellite;
  final String? darkSatellite;

  MapStyle({this.light, this.dark, this.lightSatellite, this.darkSatellite});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is! MapStyle) return false;
    return light == other.light &&
        dark == other.dark &&
        lightSatellite == other.lightSatellite &&
        darkSatellite == other.darkSatellite;
  }

  @override
  int get hashCode => light.hashCode ^ dark.hashCode ^ lightSatellite.hashCode ^ darkSatellite.hashCode;
}
