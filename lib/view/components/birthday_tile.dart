import 'package:birthdays/model/birthday.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayTile extends StatelessWidget {

  final Birthday birthday;

  BirthdayTile(this.birthday);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          onTap: null,
          
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 28,
                child: Icon(Icons.cake),
              ),
              Expanded(
                flex: 72,
                child: _BirthdayDescription(
                  birthday: birthday,
                ),
              ),
              /*const Icon(
                Icons.more_vert,
                size: 16.0,
              ),*/
            ],
          ),
        )
    );
  }
}

class _BirthdayDescription extends StatelessWidget {
  const _BirthdayDescription({
    Key key,
    this.birthday,
  }) : super(key: key);

  final Birthday birthday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            birthday.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            "Wens ze een gelukkige verjaardag!",
            style: const TextStyle(fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            DateFormat("d MMMM, H:m").format(birthday.date),
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
