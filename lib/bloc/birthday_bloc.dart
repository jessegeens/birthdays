import 'dart:async';

import 'package:birthdays/bloc/bloc.dart';
import 'package:birthdays/data/birthday_repository.dart';
import 'package:birthdays/data/repository.dart';
import 'package:birthdays/model/birthday.dart';
import 'package:flutter/foundation.dart';

class BirthdayBloc implements BLoC {

  Repository<Birthday> _repository = BirthdayRepository();

  final _birthdayController = StreamController<List<Birthday>>();
  final _birthdaysTodayController = StreamController<List<Birthday>>();
  
  Stream<List<Birthday>> get birthdayStream => _birthdayController.stream;

  Stream<List<Birthday>> get birthdaysTodayStream => _birthdayController.stream.map(
    (birthdaylist) => birthdaylist.where((birthday) => birthday.isToday).toList()
  );
  
  BirthdayBloc(){
    _repository.receive().forEach( 
      (bdays) {
        _birthdayController.sink.add(bdays.toList());
        _birthdaysTodayController.sink.add(bdays.toList().where((birthday) => birthday.isToday).toList());
      }
    );
  }

  @override
  void dispose() {
    _birthdayController.close();
    _birthdaysTodayController.close();
  }
  
}

/*_birthdaysTodayController.stream;
  /* */ */