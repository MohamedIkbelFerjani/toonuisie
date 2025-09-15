import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final Set<Marker> _markers = {};

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        // Home, do nothing
        break;
      case 1:
        context.go('/leaderboard');
        break;
      case 2:
        context.go('/events');
        break;
      case 3:
        context.go('/rewards');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.add(
        const Marker(
          markerId: MarkerId('1'),
          position: LatLng(36.8065, 10.1815),
          infoWindow: InfoWindow(title: 'Tunis'),
        ),
      );
      _markers.add(
        const Marker(
          markerId: MarkerId('2'),
          position: LatLng(35.8256, 10.6411),
          infoWindow: InfoWindow(title: 'Sousse'),
        ),
      );
      _markers.add(
        const Marker(
          markerId: MarkerId('3'),
          position: LatLng(34.7406, 10.7603),
          infoWindow: InfoWindow(title: 'Sfax'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CleanTunisia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(34.85, 9.53), // Center of Tunisia
          zoom: 7,
        ),
        markers: _markers,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/report-cleanup'),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
