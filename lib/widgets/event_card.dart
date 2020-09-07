import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

/// Create an event card
/// [name] Event name
/// [speaker] Event speaker
/// [place] Place of event
/// [startTime] Event start time
/// [endTime] Event end time
class EventCard extends StatefulWidget {
  final Text name;
  final Text speaker;
  final String place;
  final DateTime startTime;
  final DateTime endTime;
  final String summary;

  const EventCard({
    Key key,
    this.name,
    this.speaker,
    this.place,
    this.startTime,
    this.endTime,
    this.summary
  }) : super(key: key);

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
   
  Widget build(BuildContext context) {
    DateTime startTimeCourse = widget.startTime.add(new Duration(hours: 2));
    DateTime endTimeCourse = widget.endTime.add(new Duration(hours: 2));
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        title: widget.name,
        enabled: isEventAlreadyStarted(eventStartTime: widget.startTime),
        subtitle: Text('${Jiffy(startTimeCourse).format("hh:mm")} - ${Jiffy(endTimeCourse).format("hh:mm")}  ${widget.summary.split('/')[1]}'), //subtitle: Text(widget.summary.split('/')[1]),
          trailing: Text(widget.place, style: TextStyle(color: Colors.blueAccent))

      ),
    );
  }

  bool isEventAlreadyStarted({@required DateTime eventStartTime}) {
    return DateTime.now().isBefore(eventStartTime);
  }
}
