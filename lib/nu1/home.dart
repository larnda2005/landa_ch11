import 'package:flutter/material.dart';
import 'package:larda_chapter11/nu1/ttp.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Trip> _trips = [];
  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', nttp: 'Rome', lttp: 'Italy'))
      ..add(Trip(id: '1', nttp: 'Paris', lttp: 'France'))
      ..add(Trip(id: '2', nttp: 'New York', lttp: 'USA - New York'))
      ..add(Trip(id: '3', nttp: 'Cancun', lttp: 'Mexico'))
      ..add(Trip(id: '4', nttp: 'London', lttp: 'England'))
      ..add(Trip(id: '5', nttp: 'Sydney', lttp: 'Australia'))
      ..add(Trip(id: '6', nttp: 'Miami', lttp: 'USA - Florida'))
      ..add(Trip(id: '7', nttp: 'Rio de Janeiro', lttp: 'Brazil'))
      ..add(Trip(id: '8', nttp: 'Cusco', lttp: 'Peru'))
      ..add(Trip(id: '9', nttp: 'New Delhi', lttp: 'India'))
      ..add(Trip(id: '10', nttp: 'Tokyo', lttp: 'Japan'));
  }

  void _markTripCompleted() {}
  void _deleteTrip() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dismissible App')),
        body: ListView.builder(
          itemCount: _trips.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(_trips[index].id),
              child: _buildListTile(index),
              background: _buildCompleteTrip(),
              secondaryBackground: _buildRemoveTrip(),
              onDismissed: (DismissDirection direction) {
                direction == DismissDirection.startToEnd
                    ? _markTripCompleted()
                    : _deleteTrip();
                setState(() {
                  _trips.removeAt(index);
                });
              },
            );
          },
        ));
  }

  ListTile _buildListTile(int index) {
    return ListTile(
      title: Text('${_trips[index].nttp}'),
      subtitle: Text(_trips[index].lttp),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }

  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
