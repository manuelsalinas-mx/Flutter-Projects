import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

// RadioListTile enumeration
enum Transportation { none, car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.none;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        RadioListTile(
            title: Text(Transportation.none.name),
            value: Transportation.none,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.none;
                })),

         RadioListTile(
            title: Text(Transportation.car.name),
            subtitle: Text('Viajar por auto'),
            value: Transportation.car,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.car;
                })),

                 RadioListTile(
            title: Text(Transportation.plane.name),
            subtitle: Text('Viajar en avion'),
            value: Transportation.plane,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.plane;
                })),

                 RadioListTile(
            title: Text(Transportation.boat.name),
            subtitle: Text('Viajar en barco'),
            value: Transportation.boat,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.boat;
                })),

                 RadioListTile(
            title: Text(Transportation.submarine.name),
            subtitle: Text('Viajar en submarino'),
            value: Transportation.submarine,
            groupValue: selectedTransportation,
            onChanged: (value) => setState(() {
                  selectedTransportation = Transportation.submarine;
                })),
      ],
    );
  }
}
