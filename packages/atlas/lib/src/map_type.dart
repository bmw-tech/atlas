/// Type of map tiles to display.

enum MapType {
  /// Do not display map tiles.
  none,

  /// Normal tiles (traffic and labels, subtle terrain information).
  normal,

  /// Satellite imaging tiles (aerial photos)
  satellite,

  /// Terrain tiles (indicates type and height of terrain)
  terrain,

  /// Hybrid tiles (satellite images with some labels/overlays)
  hybrid,
  
}

