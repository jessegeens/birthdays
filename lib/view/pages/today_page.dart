import 'package:birthdays/bloc/birthday_bloc.dart';
import 'package:birthdays/bloc/bloc_provider.dart';
import 'package:birthdays/model/birthday.dart';
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
        stream: _bloc.birthdayStream,
        builder: (context, snapshot) {
          if (snapshot.hasData){
            List<Birthday> birthdays = snapshot.data;
            return ListView.builder(
              itemCount: birthdays.length,
              itemBuilder: (context, index) {
                return Text(birthdays[index].name);
              }
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