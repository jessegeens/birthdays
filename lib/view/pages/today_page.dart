import 'package:birthdays/bloc/birthday_bloc.dart';
import 'package:birthdays/bloc/bloc_provider.dart';
import 'package:birthdays/model/birthday.dart';
import 'package:birthdays/view/components/birthday_tile.dart';
import 'package:flutter/material.dart';

class TodayPage extends StatefulWidget {
  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final BirthdayBloc _bloc = BirthdayBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc, 
      child: StreamBuilder(
        stream: _bloc.birthdaysTodayStream,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            List<Birthday> birthdays = snapshot.data;
            return ListView(
              children: birthdays.map(
                (birthday) => BirthdayTile(birthday)
              ).toList().cast<Widget>(),
            );
          } else {
            debugPrint("snapshot: ${snapshot.data.toString()}");
            return CircularProgressIndicator();
          }
        },
      )    
    );
  }
}