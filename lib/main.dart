import 'package:flutter/material.dart';
import 'views/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}



// // ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Zeiterfassung App',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//       ),
//       home: const TimeManagementPage(),
//     );
//   }
// }

// class TimeManagementPage extends StatefulWidget {
//   const TimeManagementPage({super.key});
//   @override
//   _TimeManagementPageState createState() => _TimeManagementPageState();
// }

// class _TimeManagementPageState extends State<TimeManagementPage> {
//   DateTime? lastCheckIn;
//   DateTime? lastCheckOut;
//   Duration totalWorkDuration = Duration.zero;
//   List<DateTime> checkInTimes = [];
//   List<DateTime> checkOutTimes = [];
//   DateTime? breakStartTime;
//   Duration totalBreakDuration = Duration.zero;
//   bool isOnBreak = false;
//   Timer? breakTimer;
//   Duration currentBreakDuration = Duration.zero;

//   void _recordCheckIn() {
//     setState(() {
//       if (lastCheckOut != null && lastCheckIn != null) {
//         totalWorkDuration += lastCheckOut!.difference(lastCheckIn!) - totalBreakDuration;
//       }
//       lastCheckIn = DateTime.now();
//       checkInTimes.add(lastCheckIn!);
//     });
//   }

//   void _recordCheckOut() {
//     setState(() {
//       if (lastCheckIn != null) {
//         lastCheckOut = DateTime.now();
//         totalWorkDuration += lastCheckOut!.difference(lastCheckIn!) - totalBreakDuration;
//         checkOutTimes.add(lastCheckOut!);
//         lastCheckIn = null; // Reset after checkout
//       }
//     });
//   }

//   void _toggleBreak() {
//     setState(() {
//       if (isOnBreak) {
//         totalBreakDuration += currentBreakDuration;
//         currentBreakDuration = Duration.zero;
//         breakTimer?.cancel();
//         breakStartTime = null;
//       } else {
//         breakStartTime = DateTime.now();
//         breakTimer = Timer.periodic(Duration(seconds: 1), (timer) {
//           setState(() {
//             currentBreakDuration = DateTime.now().difference(breakStartTime!);
//           });
//         });
//       }
//       isOnBreak = !isOnBreak;
//     });
//   }

//   String _formatDateTime(DateTime dateTime) {
//     return DateFormat('HH:mm').format(dateTime);
//   }

//   String _formatDuration(Duration duration) {
//     return '${duration.inHours} Stunden ${duration.inMinutes.remainder(60)} Minuten';
//   }

//   String _formatDurationInMinutes(Duration duration) {
//     final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = (duration.inSeconds.remainder(60)).toString().padLeft(2, '0');
//     return '$minutes Minuten $seconds Sekunden';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Zeiterfassung'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: Text(
//                 "Arbeit Zeit",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), 
//               ),
//             ),
//             const SizedBox(height: 20),
//             ListTile(
//               title: Text("Datum: ${DateFormat('dd.MM.yyyy').format(DateTime.now())}"),
//               trailing: const Icon(Icons.calendar_today),
//             ),
//             ElevatedButton(
//               onPressed: _recordCheckIn,
//               child: const Text('Check In'),
//             ),
//             ElevatedButton(
//               onPressed: _recordCheckOut,
//               child: const Text('Check Out'),
//             ),
//             ElevatedButton(
//               onPressed: _toggleBreak,
//               child: Text(isOnBreak ? 'End Break' : 'Start Break'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "Zusammenfassung",
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             Text("Datum: ${DateFormat('dd.MM.yyyy').format(DateTime.now())}"),
//             Text("Arbeitszeit: ${_formatDuration(totalWorkDuration)}"),
//             Text("Pause: ${_formatDuration(totalBreakDuration)}"),
//             if (isOnBreak)
//               Text(
//                 "Break Duration: ${_formatDurationInMinutes(currentBreakDuration)}",
//                 style: TextStyle(color: Colors.red),
//               ),
//             const SizedBox(height: 20),
//             Text(
//               "Check In Zeiten",
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             for (var checkIn in checkInTimes) Text(_formatDateTime(checkIn)),
//             const SizedBox(height: 20),
//             Text(
//               "Check Out Zeiten",
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             for (var checkOut in checkOutTimes) Text(_formatDateTime(checkOut)),
//           ],
//         ),
//       ),
//     );
//   }
// }

