import 'package:birthdays/bloc/birthday_bloc.dart';
import 'package:birthdays/bloc/bloc_provider.dart';
import 'package:birthdays/model/birthday.dart';
import 'package:birthdays/view/components/birthday_tile.dart';
import 'package:flutter/material.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
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
            return ListView(
              children: birthdays.map(
                (birthday) => BirthdayTile(birthday)
              ).toList().cast<Widget>(),
            );
          } else if (snapshot.hasError) {
            return Text("Er is een fout opgetreden");
          } else {
            //debugPrint("snapshot all: ${snapshot.data.toString()}");
            return CircularProgressIndicator();
          }
        },
      )    
    );
  }
}