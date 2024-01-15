import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteMapPage extends StatefulWidget {
  final String initialAddress;

  const CampsiteMapPage({Key? key, required this.initialAddress}) : super(key: key);

  @override
  State<CampsiteMapPage> createState() => _CampsiteMapPageState();
}

class _CampsiteMapPageState extends State<CampsiteMapPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set();

  @override
  void initState() {
    super.initState();
    _searchAndNavigate(widget.initialAddress);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _searchAndNavigate(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      Location first = locations.first;

      mapController.animateCamera(
        CameraUpdate.newLatLng(LatLng(first.latitude, first.longitude)),
      );

      setState(() {
        markers.clear();
        markers.add(
          Marker(
            markerId: MarkerId('selectedLocation'),
            position: LatLng(first.latitude, first.longitude),
            infoWindow: InfoWindow(
              title: 'Selected Location',
              snippet: address,
            ),
          ),
        );
      });
    } catch (e) {
      print('Error searching for address: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(gapMain),
            child: InkWell(
              child: iconClose(mColor: Colors.black),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(0, 0), // 초기 값을 0,0으로 설정
              zoom: 17.0,
            ),
            markers: markers,
          ),
        ],
      ),
    );
  }
}
