import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapView extends StatefulWidget {
  final double height;
  final double width;
  final Position position;
  const MapView(
      {Key? key,
      required this.height,
      required this.position,
      required this.width})
      : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();
  late Marker marker;
  @override
  void initState() {
    super.initState();

    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    marker = Marker(
      markerId: const MarkerId("1"),
      position: LatLng(
        widget.position.latitude,
        widget.position.longitude,
      ),
      infoWindow: const InfoWindow(title: "eu", snippet: '*'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.position.latitude, widget.position.longitude),
          zoom: 14.4746,
        ),
        markers: <Marker>{marker},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
