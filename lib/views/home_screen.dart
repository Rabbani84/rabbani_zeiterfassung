import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String jobNumber;

  HomeScreen({required this.name, required this.jobNumber});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? checkInTime;
  DateTime? checkOutTime;
  Duration totalWorkDuration = Duration.zero;
  bool isOnBreak = false;
  Duration breakDuration = Duration.zero;
  DateTime? breakStartTime;

  void _recordCheckIn() {
    setState(() {
      checkInTime = DateTime.now();
    });
  }

  void _recordCheckOut() {
    setState(() {
      if (checkInTime != null) {
        checkOutTime = DateTime.now();
        totalWorkDuration += checkOutTime!.difference(checkInTime!);
      }
    });
  }

  void _toggleBreak() {
    setState(() {
      if (isOnBreak) {
        breakDuration += DateTime.now().difference(breakStartTime!);
      } else {
        breakStartTime = DateTime.now();
      }
      isOnBreak = !isOnBreak;
    });
  }

  String _formatTime(DateTime? dateTime) {
    return dateTime != null ? DateFormat('HH:mm').format(dateTime) : '--:--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'conni app', 
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          selectionColor: Colors.pinkAccent,
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hallo ${widget.name} (${widget.jobNumber})"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _recordCheckIn, child: Text('Check In')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _recordCheckOut, child: Text('Check Out')),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _toggleBreak,
              child: Text(isOnBreak ? 'End Break' : 'Start Break'),
            ),
            SizedBox(height: 20),
            Text("Check in Zeit: ${_formatTime(checkInTime)}"),
            Text("Check out Zeit: ${_formatTime(checkOutTime)}"),
            Text("Pause: ${breakDuration.inMinutes} min"),
          ],
        ),
      ),
    );
  }
}
