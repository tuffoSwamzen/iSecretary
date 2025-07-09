import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/features/canban_board/presentation/pages/canban_board_page.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key, required this.day});
  final DateTime day;

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime? _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onPressed(context),
        child: Icon(Icons.arrow_upward),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime(2024),
              lastDay: DateTime(3000),
              shouldFillViewport: true,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed(BuildContext context) {
    if (_selectedDay == null) return;
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => CanbanBoardPage(day: widget.day),
      ),
    );
  }
}
